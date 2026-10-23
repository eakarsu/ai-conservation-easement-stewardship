// Deterministic fallback over own stewardship records. No provider calls; aiGenerated is always false.
export type FallbackRow = { entity: string; status?: string | null; dueAt?: string | Date | null; monitoringDueAt?: string | Date | null; nextDueAt?: string | Date | null };
export function buildFallbackInsights(rows: FallbackRow[], now = new Date()) {
  const list = rows || [];
  const isOpen = (r: FallbackRow) => !["Approved","Closed","Done"].includes(String(r.status || ""));
  const due = (r: FallbackRow) => r.dueAt || r.monitoringDueAt || r.nextDueAt || null;
  const overdue = list.filter((r) => { const d = due(r); return isOpen(r) && d && new Date(d) < now; });
  const visits = list.filter((r) => r.entity === "StewardshipVisit");
  const violations = list.filter((r) => r.entity === "PotentialViolation" && isOpen(r));
  const approved = list.filter((r) => r.status === "Approved");
  return {
    aiGenerated: false as const,
    source: "deterministic fallback",
    label: "Deterministic fallback — not AI generated (aiGenerated: false)",
    recordCount: list.length,
    insights: [
      { id: "monitoring-overdue", label: "Easement monitoring overdue queue", count: overdue.length, summary: overdue.length ? `${overdue.length} open records are past their monitoring/due date.` : "No overdue monitoring records (count: 0)." },
      { id: "violation-triage", label: "Potential violation triage", count: violations.length, summary: violations.length ? `${violations.length} open potential violations need triage.` : "No open potential violations (count: 0)." },
      { id: "visit-coverage", label: "Stewardship visit coverage", visitCount: visits.length, approvedCount: approved.length, summary: `${visits.length} stewardship visits recorded; ${approved.length} approved records overall.` },
    ],
    sections: [
      { title: "Monitoring overdue queue", detail: `Overdue: ${overdue.length}; Total records: ${list.length}` },
      { title: "Potential violation triage", detail: `Open violations: ${violations.length}` },
      { title: "Stewardship visit coverage", detail: `Visits: ${visits.length}; Approved: ${approved.length}; Total: ${list.length}` },
    ],
  };
}

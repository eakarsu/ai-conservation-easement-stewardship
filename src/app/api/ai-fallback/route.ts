import { authorize } from "@/lib/api-auth";
import { prisma } from "@/lib/prisma";
import { recordMetadata } from "@/lib/record-policy";
import { records, errorResponse } from "@/lib/record-store";
import { buildFallbackInsights } from "@/lib/fallback-insights";
export const dynamic = "force-dynamic";
export async function GET() {
  try {
    await authorize();
    const rows: { entity: string; status?: string | null; dueAt?: string | Date | null }[] = [];
    for (const meta of Object.values(recordMetadata)) {
      const items = await records(prisma, meta.name).findMany({ take: 1000, orderBy: { createdAt: "desc" } });
      for (const item of items as Record<string, unknown>[]) rows.push({ entity: meta.name, status: typeof item.status === "string" ? item.status : null, dueAt: (item.dueAt || item.monitoringDueAt || item.nextDueAt || null) as string | Date | null });
    }
    return Response.json(buildFallbackInsights(rows));
  } catch (e) { return errorResponse(e); }
}

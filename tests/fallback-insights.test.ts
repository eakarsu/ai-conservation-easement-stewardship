import { test } from "node:test";
import assert from "node:assert/strict";
delete process.env.OPENROUTER_API_KEY; delete process.env.OPENAI_API_KEY;
import { buildFallbackInsights } from "../src/lib/fallback-insights";
test("fallback insights are labelled aiGenerated:false and preserve zero", () => {
  const out = buildFallbackInsights([{ entity: "StewardshipVisit", status: "Open", dueAt: "2020-01-01" }, { entity: "PotentialViolation", status: "Open" }], new Date("2026-01-01"));
  assert.equal(out.aiGenerated, false); assert.match(out.label, /Deterministic fallback/); assert.equal(out.insights.length, 3); assert.equal(out.recordCount, 2);
  const empty = buildFallbackInsights([]); assert.equal(empty.recordCount, 0); assert.equal(empty.insights[0].count, 0); assert.equal(empty.sections.length, 3);
});

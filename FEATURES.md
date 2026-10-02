# Conservation Easement Stewardship

Track parcel restrictions, baseline reports, annual visits, landowner communications and potential violation cases.

## Implemented records

- **Protected Property**: name, parcel Number, land Trust, owner Name, area Hectares, monitoring Due At, status.
- **Easement Term**: title, section Number, restriction Text, allowed Use, version, effective At, status.
- **Baseline Report**: title, surveyed At, surveyor, land Use, boundary Description, evidence, status.
- **Stewardship Visit**: title, visited At, steward, observations, photo References, next Due At, status.
- **Landowner Contact**: title, contacted At, contact Name, channel, discussion, follow Up At, status.
- **Use Request**: title, proposed Use, submitted At, requested At, applicant, term Reference, status.
- **Potential Violation**: title, observed At, description, term Reference, response, due At, status.
- **Restoration Action**: title, target Area, action, owner, due At, evidence, status.
- **Stewardship Expense**: title, category, incurred At, amount Cents, currency, receipt, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Easement term extraction: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Visit versus baseline comparison: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Landowner letter draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Use request evidence summary: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Violation chronology draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Annual stewardship narrative: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Stewardship monitoring coverage: Track completed versus required monitoring activities under the entered stewardship plan.
- Protected Property evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.

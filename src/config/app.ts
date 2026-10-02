export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-conservation-easement-stewardship",
  "title": "Conservation Easement Stewardship",
  "tagline": "Track parcel restrictions, baseline reports, annual visits, landowner communications and potential violation cases.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Track parcel restrictions, baseline reports, annual visits, landowner communications and potential violation cases.",
    "entities": [
      "ProtectedProperty",
      "EasementTerm",
      "BaselineReport"
    ],
    "workflows": [
      "easement-term-extraction",
      "visit-versus-baseline-comparison"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Track parcel restrictions, baseline reports, annual visits, landowner communications and potential violation cases.",
    "entities": [
      "StewardshipVisit",
      "LandownerContact",
      "UseRequest"
    ],
    "workflows": [
      "landowner-letter-draft",
      "use-request-evidence-summary"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Track parcel restrictions, baseline reports, annual visits, landowner communications and potential violation cases.",
    "entities": [
      "PotentialViolation",
      "RestorationAction",
      "StewardshipExpense"
    ],
    "workflows": [
      "violation-chronology-draft",
      "annual-stewardship-narrative"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "ProtectedProperty": {
    "name": "ProtectedProperty",
    "label": "Protected Property",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "parcelNumber",
        "kind": "string"
      },
      {
        "name": "landTrust",
        "kind": "string"
      },
      {
        "name": "ownerName",
        "kind": "string"
      },
      {
        "name": "areaHectares",
        "kind": "number"
      },
      {
        "name": "monitoringDueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "EasementTerm": {
    "name": "EasementTerm",
    "label": "Easement Term",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "sectionNumber",
        "kind": "string"
      },
      {
        "name": "restrictionText",
        "kind": "string"
      },
      {
        "name": "allowedUse",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "protectedPropertyId",
        "kind": "string"
      }
    ]
  },
  "BaselineReport": {
    "name": "BaselineReport",
    "label": "Baseline Report",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "surveyedAt",
        "kind": "date"
      },
      {
        "name": "surveyor",
        "kind": "string"
      },
      {
        "name": "landUse",
        "kind": "string"
      },
      {
        "name": "boundaryDescription",
        "kind": "string"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "protectedPropertyId",
        "kind": "string"
      }
    ]
  },
  "StewardshipVisit": {
    "name": "StewardshipVisit",
    "label": "Stewardship Visit",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "visitedAt",
        "kind": "date"
      },
      {
        "name": "steward",
        "kind": "string"
      },
      {
        "name": "observations",
        "kind": "string"
      },
      {
        "name": "photoReferences",
        "kind": "string"
      },
      {
        "name": "nextDueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "protectedPropertyId",
        "kind": "string"
      }
    ]
  },
  "LandownerContact": {
    "name": "LandownerContact",
    "label": "Landowner Contact",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "contactedAt",
        "kind": "date"
      },
      {
        "name": "contactName",
        "kind": "string"
      },
      {
        "name": "channel",
        "kind": "string"
      },
      {
        "name": "discussion",
        "kind": "string"
      },
      {
        "name": "followUpAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "protectedPropertyId",
        "kind": "string"
      }
    ]
  },
  "UseRequest": {
    "name": "UseRequest",
    "label": "Use Request",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "proposedUse",
        "kind": "string"
      },
      {
        "name": "submittedAt",
        "kind": "date"
      },
      {
        "name": "requestedAt",
        "kind": "date"
      },
      {
        "name": "applicant",
        "kind": "string"
      },
      {
        "name": "termReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "protectedPropertyId",
        "kind": "string"
      }
    ]
  },
  "PotentialViolation": {
    "name": "PotentialViolation",
    "label": "Potential Violation",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "observedAt",
        "kind": "date"
      },
      {
        "name": "description",
        "kind": "string"
      },
      {
        "name": "termReference",
        "kind": "string"
      },
      {
        "name": "response",
        "kind": "string"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "protectedPropertyId",
        "kind": "string"
      }
    ]
  },
  "RestorationAction": {
    "name": "RestorationAction",
    "label": "Restoration Action",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "targetArea",
        "kind": "string"
      },
      {
        "name": "action",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "protectedPropertyId",
        "kind": "string"
      }
    ]
  },
  "StewardshipExpense": {
    "name": "StewardshipExpense",
    "label": "Stewardship Expense",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "incurredAt",
        "kind": "date"
      },
      {
        "name": "amountCents",
        "kind": "number"
      },
      {
        "name": "currency",
        "kind": "string"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "protectedPropertyId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "protectedPropertyId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "protectedPropertyId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "protectedPropertyId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "easement-term-extraction",
    "title": "Easement term extraction",
    "description": "Easement term extraction using selected protected property records and supplied evidence.",
    "prompt": "Easement term extraction for Conservation Easement Stewardship. Operational scope: Track parcel restrictions, baseline reports, annual visits, landowner communications and potential violation cases. Specific AI scope: Compare visit notes and supplied imagery against reviewed easement terms. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "visit-versus-baseline-comparison",
    "title": "Visit versus baseline comparison",
    "description": "Visit versus baseline comparison using selected protected property records and supplied evidence.",
    "prompt": "Visit versus baseline comparison for Conservation Easement Stewardship. Operational scope: Track parcel restrictions, baseline reports, annual visits, landowner communications and potential violation cases. Specific AI scope: Compare visit notes and supplied imagery against reviewed easement terms. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "landowner-letter-draft",
    "title": "Landowner letter draft",
    "description": "Landowner letter draft using selected protected property records and supplied evidence.",
    "prompt": "Landowner letter draft for Conservation Easement Stewardship. Operational scope: Track parcel restrictions, baseline reports, annual visits, landowner communications and potential violation cases. Specific AI scope: Compare visit notes and supplied imagery against reviewed easement terms. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "use-request-evidence-summary",
    "title": "Use request evidence summary",
    "description": "Use request evidence summary using selected protected property records and supplied evidence.",
    "prompt": "Use request evidence summary for Conservation Easement Stewardship. Operational scope: Track parcel restrictions, baseline reports, annual visits, landowner communications and potential violation cases. Specific AI scope: Compare visit notes and supplied imagery against reviewed easement terms. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "violation-chronology-draft",
    "title": "Violation chronology draft",
    "description": "Violation chronology draft using selected protected property records and supplied evidence.",
    "prompt": "Violation chronology draft for Conservation Easement Stewardship. Operational scope: Track parcel restrictions, baseline reports, annual visits, landowner communications and potential violation cases. Specific AI scope: Compare visit notes and supplied imagery against reviewed easement terms. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "annual-stewardship-narrative",
    "title": "Annual stewardship narrative",
    "description": "Annual stewardship narrative using selected protected property records and supplied evidence.",
    "prompt": "Annual stewardship narrative for Conservation Easement Stewardship. Operational scope: Track parcel restrictions, baseline reports, annual visits, landowner communications and potential violation cases. Specific AI scope: Compare visit notes and supplied imagery against reviewed easement terms. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected protected property records and supplied evidence.",
    "prompt": "Evidence completeness review for Conservation Easement Stewardship. Operational scope: Track parcel restrictions, baseline reports, annual visits, landowner communications and potential violation cases. Specific AI scope: Compare visit notes and supplied imagery against reviewed easement terms. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected protected property records and supplied evidence.",
    "prompt": "Operations handoff draft for Conservation Easement Stewardship. Operational scope: Track parcel restrictions, baseline reports, annual visits, landowner communications and potential violation cases. Specific AI scope: Compare visit notes and supplied imagery against reviewed easement terms. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}

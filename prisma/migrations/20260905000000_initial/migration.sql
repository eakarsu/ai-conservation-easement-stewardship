-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProtectedProperty" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "parcelNumber" TEXT NOT NULL,
    "landTrust" TEXT NOT NULL,
    "ownerName" TEXT NOT NULL,
    "areaHectares" DOUBLE PRECISION NOT NULL,
    "monitoringDueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProtectedProperty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EasementTerm" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "sectionNumber" TEXT NOT NULL,
    "restrictionText" TEXT NOT NULL,
    "allowedUse" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "protectedPropertyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EasementTerm_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BaselineReport" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "surveyedAt" TIMESTAMP(3) NOT NULL,
    "surveyor" TEXT NOT NULL,
    "landUse" TEXT NOT NULL,
    "boundaryDescription" TEXT NOT NULL,
    "evidence" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "protectedPropertyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BaselineReport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StewardshipVisit" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "visitedAt" TIMESTAMP(3) NOT NULL,
    "steward" TEXT NOT NULL,
    "observations" TEXT NOT NULL,
    "photoReferences" TEXT NOT NULL,
    "nextDueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "protectedPropertyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StewardshipVisit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LandownerContact" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "contactedAt" TIMESTAMP(3) NOT NULL,
    "contactName" TEXT NOT NULL,
    "channel" TEXT NOT NULL,
    "discussion" TEXT NOT NULL,
    "followUpAt" TIMESTAMP(3),
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "protectedPropertyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LandownerContact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UseRequest" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "proposedUse" TEXT NOT NULL,
    "submittedAt" TIMESTAMP(3) NOT NULL,
    "requestedAt" TIMESTAMP(3) NOT NULL,
    "applicant" TEXT NOT NULL,
    "termReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "protectedPropertyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UseRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PotentialViolation" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "observedAt" TIMESTAMP(3) NOT NULL,
    "description" TEXT NOT NULL,
    "termReference" TEXT NOT NULL,
    "response" TEXT NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "protectedPropertyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PotentialViolation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RestorationAction" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "targetArea" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "evidence" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "protectedPropertyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RestorationAction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StewardshipExpense" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "incurredAt" TIMESTAMP(3) NOT NULL,
    "amountCents" INTEGER NOT NULL,
    "currency" TEXT NOT NULL,
    "receipt" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "protectedPropertyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StewardshipExpense_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "protectedPropertyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "protectedPropertyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "protectedPropertyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "ProtectedProperty_createdAt_idx" ON "ProtectedProperty"("createdAt");

-- CreateIndex
CREATE INDEX "EasementTerm_createdAt_idx" ON "EasementTerm"("createdAt");

-- CreateIndex
CREATE INDEX "EasementTerm_protectedPropertyId_idx" ON "EasementTerm"("protectedPropertyId");

-- CreateIndex
CREATE INDEX "BaselineReport_createdAt_idx" ON "BaselineReport"("createdAt");

-- CreateIndex
CREATE INDEX "BaselineReport_protectedPropertyId_idx" ON "BaselineReport"("protectedPropertyId");

-- CreateIndex
CREATE INDEX "StewardshipVisit_createdAt_idx" ON "StewardshipVisit"("createdAt");

-- CreateIndex
CREATE INDEX "StewardshipVisit_protectedPropertyId_idx" ON "StewardshipVisit"("protectedPropertyId");

-- CreateIndex
CREATE INDEX "LandownerContact_createdAt_idx" ON "LandownerContact"("createdAt");

-- CreateIndex
CREATE INDEX "LandownerContact_protectedPropertyId_idx" ON "LandownerContact"("protectedPropertyId");

-- CreateIndex
CREATE INDEX "UseRequest_createdAt_idx" ON "UseRequest"("createdAt");

-- CreateIndex
CREATE INDEX "UseRequest_protectedPropertyId_idx" ON "UseRequest"("protectedPropertyId");

-- CreateIndex
CREATE INDEX "PotentialViolation_createdAt_idx" ON "PotentialViolation"("createdAt");

-- CreateIndex
CREATE INDEX "PotentialViolation_protectedPropertyId_idx" ON "PotentialViolation"("protectedPropertyId");

-- CreateIndex
CREATE INDEX "RestorationAction_createdAt_idx" ON "RestorationAction"("createdAt");

-- CreateIndex
CREATE INDEX "RestorationAction_protectedPropertyId_idx" ON "RestorationAction"("protectedPropertyId");

-- CreateIndex
CREATE INDEX "StewardshipExpense_createdAt_idx" ON "StewardshipExpense"("createdAt");

-- CreateIndex
CREATE INDEX "StewardshipExpense_protectedPropertyId_idx" ON "StewardshipExpense"("protectedPropertyId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_protectedPropertyId_idx" ON "OperationalTask"("protectedPropertyId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_protectedPropertyId_idx" ON "RuleVersion"("protectedPropertyId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_protectedPropertyId_idx" ON "DocumentRequirement"("protectedPropertyId");

-- AddForeignKey
ALTER TABLE "EasementTerm" ADD CONSTRAINT "EasementTerm_protectedPropertyId_fkey" FOREIGN KEY ("protectedPropertyId") REFERENCES "ProtectedProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BaselineReport" ADD CONSTRAINT "BaselineReport_protectedPropertyId_fkey" FOREIGN KEY ("protectedPropertyId") REFERENCES "ProtectedProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StewardshipVisit" ADD CONSTRAINT "StewardshipVisit_protectedPropertyId_fkey" FOREIGN KEY ("protectedPropertyId") REFERENCES "ProtectedProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LandownerContact" ADD CONSTRAINT "LandownerContact_protectedPropertyId_fkey" FOREIGN KEY ("protectedPropertyId") REFERENCES "ProtectedProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UseRequest" ADD CONSTRAINT "UseRequest_protectedPropertyId_fkey" FOREIGN KEY ("protectedPropertyId") REFERENCES "ProtectedProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PotentialViolation" ADD CONSTRAINT "PotentialViolation_protectedPropertyId_fkey" FOREIGN KEY ("protectedPropertyId") REFERENCES "ProtectedProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RestorationAction" ADD CONSTRAINT "RestorationAction_protectedPropertyId_fkey" FOREIGN KEY ("protectedPropertyId") REFERENCES "ProtectedProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StewardshipExpense" ADD CONSTRAINT "StewardshipExpense_protectedPropertyId_fkey" FOREIGN KEY ("protectedPropertyId") REFERENCES "ProtectedProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_protectedPropertyId_fkey" FOREIGN KEY ("protectedPropertyId") REFERENCES "ProtectedProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_protectedPropertyId_fkey" FOREIGN KEY ("protectedPropertyId") REFERENCES "ProtectedProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_protectedPropertyId_fkey" FOREIGN KEY ("protectedPropertyId") REFERENCES "ProtectedProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;


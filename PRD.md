```markdown
# Product Requirements Document
# IDSMS-CIS: Internship Document Submission and Monitoring System for CIS

**Version:** 1.1 *(Revised to address architectural, logical, and specification gaps)*  
**Date:** April 2026  
**Institution:** Saint Louis University — SAMCIS  
**Course:** IT 321  
**Team (Team Beacon):**
- Abanador, Frencine Daine L.
- Andres, James Matthew S.
- Antonio, Shantea Myles C.
- Aragon, Danielle John P.
- Avaricio, Kenneth Russel C.
- Domenden, Gillian D.
- Gayaso, Ulrich L.
- Suarez, Steven Dale O.

**Project Adviser:** Ria Andrea N. Fernandez

---

## Problem Statement

Saint Louis University's SAMCIS department oversees internship programs for three degree programs — BSIT (600 hours), BSCS (240 hours), and BMMA (500 hours) — all of which are governed by CHED CMO No. 104, Series of 2017 (the Student Internship Program in the Philippines / SIPP). The internship lifecycle spans three phases: **pre-deployment**, **active deployment**, and **post-deployment**, each requiring structured document submission, review, and approval workflows involving students, faculty advisers, department coordinators, and host training establishments (HTEs).

Currently, the institution relies primarily on **Google Classroom** supplemented by email, spreadsheets, and manual processes. This general-purpose platform was designed for coursework management and lacks the compliance-enforcement capabilities required by SIPP. Specific, documented pain points derived from student intern interviews include:

- **100%** of interviewed interns found MOA processing a major deployment bottleneck, with back-and-forth communication handled entirely via email with no status tracking.
- **66.7%** experienced late submission incidents caused by closed Google Classroom submission bins, forcing informal workarounds via private comments, Google Chat, or email.
- **66.7%** reported errors in submissions — missing signatures, incorrect dates, mismatched hour counts — requiring manual revision loops with no structured tracking.
- Faculty review turnaround ranges from **2 days to 2 weeks**, with no consolidated feedback view for students.
- No live compliance dashboard exists; coordinators must manually consolidate submission statuses across multiple Classroom entries using spreadsheets.
- Final report generation is entirely manual, using school-provided templates with no traceability codes or automated output.

The result is a fragmented, high-administrative-overhead workflow with limited visibility, inconsistent turnaround times, and no compliance gating — meaning students can begin deployment without all required documents being verified.

---

## Goals

- Centralize the entire internship lifecycle (pre-deployment through post-deployment) into a single, purpose-built web platform aligned with the SIPP regulatory framework.
- Enforce compliance gating: no student may progress to active deployment without all nine pre-deployment checklist items being approved.
- Automate hour computation, attendance tracking, and schedule adherence monitoring to eliminate manual calculation errors.
- Provide real-time, role-specific compliance dashboards and a **Unified Calendar** for students, faculty advisers, department coordinators, and super admins to intuitively track activities and anticipate OJT completion dates.
- Integrate assistive AI features (similarity detection and sentiment analysis) as advisory indicators to support — not replace — faculty judgment during report review.
- Automate document generation (endorsement letters, weekly/monthly report PDFs, final report cover pages) with system-generated reference codes for accreditation traceability.
- Reduce administrative burden on faculty advisers and coordinators through structured workflows, notifications, and bulk operations.
- Maintain full historical data per semester for institutional audit and accreditation support.
- Comply with the Philippine Data Privacy Act of 2012 (RA 10173) and SLU's institutional data privacy policy.

---

## Primary Users

| Role | Description |
|---|---|
| **Student Intern** | BSIT, BSCS, or BMMA student undergoing internship. Most active user across all phases. |
| **Faculty Adviser** | SLU faculty member assigned to one or more class groups. Reviews checklist items, weekly/monthly reports, deviation reports, and generates endorsement letters. |
| **Department Coordinator** | SAMCIS staff overseeing internship program compliance. Approves work plans, manages MOA records, bulk-enrolls students, and monitors department-wide compliance. |
| **Super Admin** | System administrator. Manages all user accounts, roles, system-wide configurations, semester archiving, and audit logs. Has exclusive access to the Export Center and system settings. |

> **Out of scope user:** Company/HTE supervisors do not have a portal in v1.0.

---

## User Needs

### Student Intern
- Know exactly which pre-deployment documents are required, their current approval status, and what action is needed.
- Submit weekly and monthly accomplishment reports through structured, auto-populated forms without needing to remember the format.
- See a real-time count of hours rendered vs. hours required, and a projected completion date.
- Receive timely email and in-app notifications when reports are returned, approved, or deadlines are approaching.
- Download their attendance log as CSV.
- Preview and confirm their report as a PDF before final submission.
- View a unified calendar to track deadlines, holidays, and their projected OJT completion date.

### Faculty Adviser
- See a single dashboard view of all assigned students' compliance status, hours progress, and report submission state.
- Review weekly reports with AI-generated similarity and sentiment flags surfaced inline — without having to toggle to a separate tool.
- Approve or return individual pre-deployment checklist items with written comments.
- Validate or reject deviation reports (absences, overtime, undertime) before they affect hour computation.
- Generate individual or bulk endorsement letters in PDF format for eligible students.
- Export class-group compliance reports to Excel.
- View a calendar aggregating submission deadlines for all assigned class groups.

### Department Coordinator
- Approve or return student work plans, verifying that planned tasks match the student's enrolled program.
- Manage MOA records including upload, validity tracking, and automated expiry alerts.
- Bulk-enroll students via CSV upload linked to official SLU class codes.
- Approve or return final technical reports.
- Access a department-wide compliance dashboard spanning all three programs (BSIT, BSCS, BMMA).
- Export full compliance reports in Excel or CSV format.
- View a calendar displaying department-wide milestones, MOA expirations, and clustered projected completion dates.

### Super Admin
- Manage all user accounts, assign and modify roles.
- Configure system-wide settings: required completion hours per program, similarity detection thresholds, deadline reminder intervals, MOA expiry alert days, session timeout.
- Create and archive semester records.
- Access the immutable audit log for all system activity.
- Perform bulk data exports (all students, all reports, audit log, MOA records, user accounts, AI flag summary) requiring MFA confirmation.

---

## Scope

### In Scope

- **Authentication & User Management:** Role-based access control (RBAC) for four roles, institutional email login, MFA (OTP/email), first-login password enforcement, session auto-expiry, bulk student CSV/Excel import, immutable audit logging for login and role events, and password reset flow.
- **Company Profile & MOA Management:** Company registration with autocomplete and duplicate detection, MOA upload (PDF/Drive link), MOA lifecycle stage tracking, automated expiry alerts.
- **Pre-Deployment Checklist:** Per-student tracking of all nine required documents, faculty approve/return/comment per item, real-time completion percentage, endorsement letter gating (blocked until all nine items approved), consent logging for Data Privacy and Internship Orientation.
- **Work Plan Submission & Approval:** Student submission using institutional template, coordinator review/approval/return, program-task alignment verification, endorsement letter draft queuing on approval, fixed schedule derived from approved work plan.
- **Attendance & Time Tracking:** Calendar-based schedule with Philippine national/regional holidays and company non-working days, deviation reports with proof attachments and faculty validation, automated hour computation, configurable required hours per program via admin UI, and mid-internship schedule change workflow.
- **Weekly & Monthly Report Submission:** Auto-populated structured forms, client-side copy-paste detection flagging, Tuesday deadline enforcement with late-note requirement, faculty Approve/Return/Regard/Disregard workflow with email notifications, monthly aggregation by calendar month.
- **Final Technical Report:** Unlocks only after configurable hour threshold is met, includes company profile summary, peer/supervisor evaluation scores, and proof attachments.
- **Document Generation:** Endorsement letters (individual and bulk PDF), weekly/monthly report PDFs, final report cover pages — all with system-generated reference codes and timestamps via Puppeteer server-side rendering, including failure recovery logic.
- **AI-Assisted Features:** Similarity detection (Gemini `text-embedding-004`, pgvector, 0.70 threshold), sentiment analysis (Gemini 2.5 Flash, Positive/Neutral/Negative + confidence score), cached results, advisory-only outputs.
- **Dashboards & Monitoring:** Real-time role-specific dashboards; per-student hours, checklist %, submission status, anomaly flags; weekly dashboard summary reports; semester-level archiving for accreditation.
- **Unified Calendar & Timeline Tracking:** Role-specific calendar views displaying submission deadlines, holidays, approved deviations, and auto-calculated "Projected OJT Completion Date" milestones.
- **Notification System:** 12 automated trigger events via Resend; configurable intervals via Super Admin UI; in-app status indicators.
- **Export & Reporting:** Excel/CSV export of compliance data, hours summaries, checklist statuses, flagged student lists.
- **Data Privacy & Security:** RA 10173 compliance, RBAC at middleware and service layers, Supabase RLS, HTTPS/TLS 1.2+, time-limited signed file URLs, soft deletes for full audit history, DSAR workflow, and file retention/cleanup policies.

### Out of Scope

- Native mobile application (iOS/Android)
- Company/HTE supervisor portal
- Automated grading or approval decisions by AI
- Integration with external LMS platforms beyond Google Classroom (as complementary context)
- Multi-institution or multi-department beyond SAMCIS CIS programs in v1.0
- Real-time WebSocket infrastructure (polling/SSE used instead)
- **Mid-internship Company Transfer Workflow:** Students changing host companies *after* deployment has begun is out of scope for v1.0. (If this occurs, the Department Coordinator must manually intervene to adjust records; the system assumes a 1:1 student-to-company relationship per semester).

---

## Requirements

### Functional Requirements

#### Module 1 — User Management & Authentication

| ID | Requirement |
|---|---|
| FR-UM-01 | System must support four distinct user roles: Super Admin, Department Coordinator, Faculty Adviser, Student Intern — each with role-specific UI and API access enforced by RBAC middleware. |
| FR-UM-02 | Students must be bulk-registered via CSV or Excel file import using official SLU class lists. |
| FR-UM-03 | Default passwords must be generated using a salted hash of the student ID number. |
| FR-UM-04 | Password change must be enforced on first login before accessing any other feature. |
| FR-UM-05 | System must support OTP or email-based MFA for sensitive operations. |
| FR-UM-06 | Sessions must automatically expire after a configurable period of inactivity (default: 30 minutes). |
| FR-UM-07 | Account must lock after 5 consecutive failed login attempts. |
| FR-UM-08 | An immutable audit log must record all login attempts, role changes, and security-sensitive actions with user identity, IP address, timestamp, and affected record. |
| FR-UM-09 | RBAC must be enforced at both the route/middleware level AND the service/record-ownership level (e.g., a student cannot access another student's report even via a crafted API request). |
| **FR-UM-10** | **Password Reset Flow:** System must provide a `/auth/reset-password` route. Users can request a magic link sent to their SLU email. The link is valid for 1 hour. Locked accounts may use this to reset credentials, but the account remains locked from login until the 15-minute lockout timer expires or a Super Admin manually unlocks it. |

#### Module 2 — Company Profile & MOA Management

| ID | Requirement |
|---|---|
| FR-MOA-01 | Students and faculty must be able to register host company profiles including: company name, full address, work modality (On-site / Work-from-Home / Hybrid), supervisor/HR contact info, student position title. |
| FR-MOA-02 | Company name entry must support autocomplete and duplicate detection. |
| FR-MOA-03 | MOA records must be uploadable as PDF files or Google Drive links, with system-captured metadata: validity period, academic programs covered. |
| FR-MOA-04 | MOA lifecycle stages must be tracked: Drafting → Pending → For HTE Review → For University Review → Approved/Active → Expiring/Expired → Archived. |
| FR-MOA-05 | System must automatically identify MOAs approaching expiration and send email and in-app alerts to the internship coordinator. |
| FR-MOA-06 | Government-issued business permits must be uploadable and verifiable by faculty or coordinators before the student is activated for internship. |
| FR-MOA-07 | MOA record access must be restricted to authorized Faculty Advisers and Department Coordinators only. |

#### Module 3 — Pre-Deployment Checklist

The following nine documents must be tracked per student:
1. Medical Certificate
2. Psychological Clearance
3. Parent's Consent and Undertaking
4. Company Reply Form
5. Data Privacy (DP) Orientation Certification
6. Internship Orientation Completion Record
7. Government-Issued Company Permits
8. Work Plan (approved)
9. Memorandum of Agreement (MOA)

| ID | Requirement |
|---|---|
| FR-CK-01 | Each of the nine pre-deployment documents must be tracked as a separate checklist item per student. |
| FR-CK-02 | Faculty must be able to Approve, Return (with written comments), or leave pending each checklist item individually. |
| FR-CK-03 | Student checklist completion percentage must be displayed in real time. |
| **FR-CK-04** | **Endorsement Letter Gating:** Endorsement letter generation and progression to active deployment are strictly blocked until all nine checklist items are approved. *(Note: Work plan approval (Item 8) only queues a draft record; the actual PDF generation and download unlock only when Item 9 is also approved).* |
| FR-CK-05 | Data Privacy Orientation and Internship Orientation must be tracked separately, with user consent to data collection logged during orientation registration. |
| FR-CK-06 | Checklist item status updates must trigger in-app and email notifications to the student. |

#### Module 4 — Work Plan Submission & Approval

| ID | Requirement |
|---|---|
| FR-WP-01 | Students must submit a work plan using the institutional template before deployment. |
| FR-WP-02 | Work plans must be reviewed and approved or returned by the department coordinator. |
| FR-WP-03 | System must verify that planned tasks match the student's academic program; if the company has its own work plan format, the system must notify the student and request additional info. |
| FR-WP-04 | Approved work plans must be used to: (a) establish the fixed work schedule, (b) calculate required hours, (c) determine projected completion date. |
| **FR-WP-05** | **Draft Queuing:** Upon work plan approval, the system queues a draft endorsement letter record in `generated_documents` with status `pending_draft`. This record does NOT become downloadable or final until the 9/9 pre-deployment gate (FR-CK-04) is fully satisfied. |
| FR-WP-06 | Approved work plans must be locked and non-editable; changes require a new submission with coordinator re-approval. |

#### Module 5 — Attendance & Time Tracking

| ID | Requirement |
|---|---|
| FR-AT-01 | Upon work plan approval, each student must configure their work schedule (daily hours, working days) in the system. |
| FR-AT-02 | System must populate a calendar-based schedule pre-populated with Philippine national holidays, regional holidays, and company-specific non-working days that students can mark as applicable. |
| FR-AT-03 | Absences, undertime, and overtime must be submitted via structured deviation report forms with date, reason category, and supporting documentation upload. |
| FR-AT-04 | All deviation reports must be validated by the faculty adviser before affecting hour computation. |
| FR-AT-05 | System must automatically compute: total hours rendered, required hours remaining, and projected completion date — based only on validated attendance data. |
| FR-AT-06 | Required completion hours per program must be configurable via the admin interface, never hardcoded. |
| FR-AT-07 | Students must be able to export their attendance log as CSV. |
| **FR-AT-08** | **Schedule Change Initiation:** Students may request a mid-internship schedule change via a structured form, requiring a valid reason and supporting document (if applicable). |
| **FR-AT-09** | **Schedule Change Approval:** Schedule changes require Faculty Adviser validation followed by Department Coordinator final approval. |
| **FR-AT-10** | **Hour Computation Impact:** Approved schedule changes do *not* retroactively alter previously validated hours or reports. They only affect future hour computation and update the "Projected Completion Date." |
| **FR-AT-11** | **Audit Logging:** All schedule changes are logged in the `work_plans.scheduleChangeHistory` JSONB field with timestamps and approver IDs. |

#### Module 6 — Weekly & Monthly Report Submission

| ID | Requirement |
|---|---|
| FR-WR-01 | System must auto-generate weekly report forms based on each student's approved fixed schedule and semester calendar. |
| FR-WR-02 | Form fields must include: daily attendance status (Present/Absent/Holiday), actual work hours, work accomplishments (per day), total hours for the week (auto-calculated), running total hours, and hours remaining. |
| FR-WR-03 | Only the student may enter actual hours worked and daily accomplishments. |
| **FR-WR-04** | **Client-Side Copy-Paste Warning:** Before submission, the client-side UI compares new accomplishment text against the student's immediate prior submission. If an exact or near-exact match is detected, a blocking warning prompts the student to revise before the "Submit" button becomes active. *(Distinct from server-side vector similarity).* |
| **FR-WR-05** | **Late Submission Protocol:** Reports are due on Tuesday. Late submissions require the *student* to fill out a mandatory "Reason for Delay" text field before the system accepts the submission. Faculty can view this note during review. |
| **FR-WR-06** | **Faculty Review Actions:** Faculty can: **Approve** (hours count, status complete), **Return** (requires student revision, hours do not count yet), **Regard** (acknowledged, hours count, but marked for minor improvement/no revision needed), or **Disregard** (invalid submission, e.g., wrong week; hours do not count, requires full resubmission). |
| FR-WR-07 | Faculty and students must receive email notifications when reports are approved or returned. |
| **FR-WR-08** | **Monthly Report Aggregation:** Monthly reports aggregate weekly reports by **Calendar Month**. A monthly report can only be submitted when *all* weekly reports falling within that calendar month are in "Approved" or "Regarded" status. |
| FR-WR-09 | Students must be able to preview a PDF of their report before final submission. |
| FR-WR-10 | A submitted report PDF must be auto-generated with a system reference code and timestamp. |

#### Module 7 — Final Technical Report

| ID | Requirement |
|---|---|
| FR-FT-01 | The Final Technical Report module must only become accessible to students who have reached a configurable hour threshold (e.g., 500 of 600 for BSIT). |
| FR-FT-02 | The report must contain sections for: company profile summary, peer and supervisor evaluation scores, and proof of attachments (attendance proof, certificates of completion, certificates of participation). |
| FR-FT-03 | Final technical reports must be reviewed and approved or returned by the department coordinator. |

#### Module 8 — Document Generation

| ID | Requirement |
|---|---|
| FR-DG-01 | Endorsement letters must be auto-generated with: student name, student ID, company name and address, supervisor name and position, endorsement date, using the institution's standard letterhead format. |
| FR-DG-02 | Faculty must be able to generate bulk endorsement letters for all eligible students in a class group via a batch PDF export function. |
| FR-DG-03 | System must generate PDF versions of: weekly reports, monthly reports, endorsement letters, and final report cover pages. |
| FR-DG-04 | All generated PDFs must include a system-generated reference code and timestamp for traceability and accreditation purposes. |
| FR-DG-05 | PDF generation must only occur after the student has reviewed and confirmed report contents in the system. |
| FR-DG-06 | PDF generation must be performed server-side using Puppeteer (headless Chrome) to ensure consistent rendering across browsers and devices. |
| **FR-DG-07** | **PDF Generation Failure Recovery:** If Puppeteer generation fails (e.g., timeout, memory limit), the system retains the submission data, logs the error, sets the document status to `failed`, and provides a "Regenerate PDF" button for the user. The system will attempt a maximum of 3 retries with exponential backoff. |

#### Module 9 — AI-Assisted Features

| ID | Requirement |
|---|---|
| **FR-AI-01** | **Similarity Detection:** System must compare new accomplishment entries against the student's previous report embeddings using vector-based comparison (**Gemini `text-embedding-004`** + pgvector). *(Note: OpenAI models are not used).* |
| **FR-AI-02** | **Threshold Calibration:** Reports with a cosine similarity score exceeding the configurable threshold (default: 0.70) are flagged. This threshold is calibrated to flag near-identical text blocks while allowing standard boilerplate phrasing. Super Admin can adjust this between 0.60 and 0.85. |
| FR-AI-03 | System must include **sentiment analysis** of weekly report journal entries using Gemini 2.5 Flash, classifying output as Positive, Neutral, or Negative with a confidence score and brief reasoning. |
| FR-AI-04 | Aggregated sentiment trend indicators must be surfaced on the faculty dashboard. |
| FR-AI-05 | All AI results must be cached in the database after computation; no live API call may be made during page load. |
| FR-AI-06 | AI results must be displayed as advisory indicators only. They must never automate grading, approval, or rejection decisions. |
| FR-AI-07 | AI outputs must be displayed inline on the faculty Report Review page as part of the standard review workflow. |

#### Module 10 — Dashboard & Monitoring

| ID | Requirement |
|---|---|
| FR-DB-01 | Role-specific dashboards must be provided for: Student Intern, Faculty Adviser, Department Coordinator, and Super Admin. |
| FR-DB-02 | **Student Dashboard** must display: hours rendered vs. required, pre-deployment document completion %, estimated completion date, per-document status, weekly report submission history with statuses. |
| FR-DB-03 | **Faculty Dashboard** must display: total students, reports submitted this week, reports pending review, reports not yet submitted; per-student rows with hours progress bars, document count, weekly report status, AI flags, and action buttons; Bulk Endorse and Export functions. |
| FR-DB-04 | **Coordinator Dashboard** must display: program-level summary cards, MOA expiry alerts, full student compliance table with filters by program and status, Excel export. |
| FR-DB-05 | **Super Admin Dashboard** must display: system-wide user and semester management, required hours configuration, audit log with filter and export, semester management (archive/activate). |
| FR-DB-06 | Dashboards must auto-generate weekly summary reports exportable to Excel for offline review and accreditation use. |
| FR-DB-07 | All historical data per semester must be retained to support institutional audit requirements. |
| FR-DB-08 | System must support an end-of-semester archiving process. |

#### Module 11 — Notification System

| ID | Requirement |
|---|---|
| FR-NT-01 | System must send automated notifications for 12 trigger events: (1) account creation, (2) password reset, (3) report submission confirmation, (4) report return with revision notes, (5) submission deadline reminder at 48 hours, (6) submission deadline reminder at 24 hours, (7) endorsement letter generation, (8) MOA expiry warning, (9) pre-deployment checklist status changes, (10) work plan approval, (11) deviation report validation, (12) scheduled deadline reminders. |
| FR-NT-02 | All notification intervals must be configurable through the Super Admin interface; none may be hardcoded. |
| FR-NT-03 | In-app status indicators must be displayed for: returned reports, pending validations, upcoming deadlines, and incomplete pre-deployment requirements. |
| FR-NT-04 | Email notifications must be sent via Resend transactional email API using JSX-based React Email templates. |
| FR-NT-05 | Scheduled notifications must be dispatched by Vercel Cron Jobs. *(Note: Due to Vercel Hobby tier limits, 48h and 24h deadline checks are consolidated into a single daily cron evaluation).* |

#### Module 12 — Unified Calendar & Timeline Tracking *(NEW)*

| ID | Requirement |
|---|---|
| **FR-CAL-01** | **Unified Calendar View:** All roles have access to a calendar view displaying color-coded events: Submission Deadlines (Red), Holidays (Gray), Approved Deviations (Yellow), and Projected OJT Completion Date (Green milestone). |
| **FR-CAL-02** | **Student Calendar:** Displays the student's specific work schedule, upcoming report deadlines, and a prominent, auto-updating "Projected OJT Completion Date" based on current rendered hours and approved schedule. |
| **FR-CAL-03** | **Faculty Calendar:** Displays aggregated submission deadlines for all assigned students, highlighting weeks with high expected submission volumes. |
| **FR-CAL-04** | **Coordinator Calendar:** Displays department-wide milestones, MOA expiration dates, and clustered projected completion dates to anticipate endorsement letter generation spikes. |

---

### Non-Functional Requirements

#### Security

| ID | Requirement |
|---|---|
| NFR-SEC-01 | Role-based access control must be enforced at all system layers: middleware (route-level) and service layer (record-level ownership). |
| NFR-SEC-02 | All client-server communication must use HTTPS/TLS 1.2 or higher. |
| NFR-SEC-03 | Uploaded files must be stored in authenticated, access-controlled Supabase Storage buckets. Files must never be served via public URLs; all access must be mediated by the application server using time-limited, scoped signed URLs. |
| NFR-SEC-04 | File uploads must be validated server-side with MIME-type verification, limited to safe types: PDF, DOCX, PNG, JPG, XLSX, CSV. |
| NFR-SEC-05 | Sensitive actions (role changes, bulk exports, PDF generation, user deletion) must require re-authentication or MFA confirmation. |
| NFR-SEC-06 | Authentication endpoints must implement rate limiting to defend against brute-force attacks. |
| NFR-SEC-07 | An immutable audit log must record all data access, modification, export, and deletion events with user identity, timestamp, IP address, and affected record. |
| NFR-SEC-08 | Session JWT tokens must be HttpOnly and Secure. |
| NFR-SEC-09 | All protected routes must re-validate the session token via NextAuth.js middleware before serving any page or API response. |
| **NFR-SEC-10** | **Audit Log Immutability:** The `audit_logs` table must have an append-only Row Level Security (RLS) policy in Supabase that strictly prevents `UPDATE` or `DELETE` operations by any role, including the service role, enforced at the database level. |

#### Data Privacy & Compliance

| ID | Requirement |
|---|---|
| NFR-DP-01 | System must comply with the Philippine Data Privacy Act of 2012 (Republic Act No. 10173) and SLU's institutional data privacy policy. |
| NFR-DP-02 | Student personal data — including health-related documents, psychological records, and parent consent forms — must be accessible only to personnel on a need-to-know basis and encrypted at rest. |
| NFR-DP-03 | Explicit user consent to collect and process personal data must be logged during account registration and the orientation flow. |
| NFR-DP-04 | Data minimization must be applied — only information necessary for internship management may be collected. |
| NFR-DP-05 | The system must not expose student personal information in publicly accessible URLs, shared links, or unscoped API responses. |
| NFR-DP-06 | A data retention policy must flag records for institutional review or anonymization after the defined retention period rather than automatic deletion. |
| **NFR-DP-07** | **Data Subject Access Request (DSAR):** Users can trigger a DSAR from their Settings page. This generates a ticket logged in `audit_logs`, notifies the Super Admin, and carries a 15-day SLA for the admin to generate and provide a CSV/PDF export of the user's personal data, per NPC advisory. |
| **NFR-DP-08** | **File Retention & Cleanup:** Generated PDFs and uploaded documents are retained for 3 years post-semester. A quarterly background job flags files older than 3 years for Super Admin review before permanent deletion, preventing unbounded storage growth. |

#### Performance

| ID | Requirement |
|---|---|
| **NFR-PERF-01** | Dashboard pages must load with a p95 Time-To-First-Byte (TTFB) ≤ 800ms under a simulated load of 50 concurrent users on the Vercel Hobby tier. |
| NFR-PERF-02 | PDF generation must be consistent and accurate across different browsers and devices. |
| NFR-PERF-03 | The AI feature layer must be designed for handling concurrent requests during peak submission periods (e.g., Tuesday report deadlines). |
| **NFR-PERF-04** | Bulk operations (bulk student enrollment, bulk endorsement letter generation, bulk report export, bulk checklist review) must be supported without application timeout. This is mitigated by utilizing async server actions or background job queues to prevent 10-second serverless function timeouts, providing a "Processing..." UI state to the user while the job completes. |

#### Reliability & Availability

| ID | Requirement |
|---|---|
| **NFR-REL-01** | System targets 99.5% uptime during academic working hours (Mon-Fri, 7 AM - 7 PM PHT). Maintenance windows must be communicated to users via an in-app banner at least 48 hours in advance. |
| NFR-REL-02 | Automated data backup procedures must run at minimum daily frequency. |
| NFR-REL-03 | Failed submissions must be handled gracefully — draft data must be retained and a clear recovery message shown to the user. |

#### Usability & Accessibility

| ID | Requirement |
|---|---|
| NFR-USA-01 | System must be fully responsive and accessible on desktop and mobile browsers without requiring a native mobile application. |
| **NFR-USA-02** | **Onboarding Guide:** First-time login for all roles triggers a 3-step interactive tooltip tour covering: (1) Dashboard navigation, (2) Primary action buttons, and (3) Status indicator meanings. |
| NFR-USA-03 | Autocomplete, pre-filled defaults, and inline validation messages must reduce input errors and manual data entry. |
| NFR-USA-04 | Calendar and schedule interfaces must visually differentiate working days, non-working holidays, and submission deadlines. |
| NFR-USA-05 | Status indicators throughout the system must use consistent color-coded visual language: Submitted, Validated, Returned, Pending, Overdue. |

#### Maintainability

| ID | Requirement |
|---|---|
| NFR-MNT-01 | Architecture must be modular and service-oriented; each component must be independently updatable without compromising overall functionality. |
| NFR-MNT-02 | The AI and vector database layers must be physically and operationally distinct from the relational database layer, supporting independent scaling, model updates, and feature toggle functionality. |
| NFR-MNT-03 | All configuration parameters (program hours, holiday calendars, semester dates, submission deadlines, reminder intervals, similarity thresholds) must be configurable through the admin UI — never hardcoded. |
| **NFR-MNT-04** | **Test Coverage:** Code must conform to documented standards with a minimum of ≥ 70% line coverage for all service modules, and ≥ 90% for critical logic (hour computation, checklist gating, RBAC). |
| NFR-MNT-05 | All third-party integrations must be implemented as abstracted service adapters allowing provider replacement without refactoring core logic. |
| NFR-MNT-06 | Business logic must never be placed directly in page files or route handlers; all logic must be extracted into service modules under `/src/lib/services/`. |

#### Scalability

| ID | Requirement |
|---|---|
| NFR-SCL-01 | Architecture must support additional academic departments without requiring structural changes to the database schema or application core. |
| NFR-SCL-02 | System must support multiple semesters, academic years, and departments. |
| NFR-SCL-03 | Full historical data must be stored without performance degradation. |
| NFR-SCL-04 | The AI feature layer must support horizontal scaling for concurrent requests. |

---

## Recommended Stack

| Layer | Technology | Notes / Version Pinning |
|---|---|---|
| **Framework** | Next.js 14 (App Router) | Full-stack React framework for routing, SSR, server actions, and API routes |
| **Language** | TypeScript | Type safety across frontend and backend |
| **Styling** | Tailwind CSS | Utility-first CSS framework for consistent design system |
| **Database** | PostgreSQL 15 via Supabase | Relational database for all structured internship data |
| **ORM** | Prisma | Type-safe database access with schema-driven migrations *(Requires custom raw SQL migration to enable `vector` extension before schema generation)* |
| **Authentication** | **NextAuth.js v4.24.x** | Session management, credential provider, JWT strategy, RBAC hooks *(Pinned to v4 to ensure App Router compatibility and avoid v5 breaking changes)* |
| **File Storage** | Supabase Storage | Secure bucket-based file storage with scoped access via signed URLs *(Capped at 5MB per PDF, 2MB per image to manage free-tier limits)* |
| **Email** | Resend + React Email | Transactional email API with JSX-based template design *(Monitored for 100 emails/day free tier limit; batching applied where possible)* |
| **PDF Generation** | Puppeteer + `@sparticuz/chromium` | Headless Chrome for consistent server-rendered PDF output |
| **AI: Embeddings** | **Gemini `text-embedding-004`** | 768-dimensional vector embeddings for similarity detection *(Replaces incorrect OpenAI reference)* |
| **AI: Analysis** | Gemini 2.5 Flash | Sentiment analysis (Positive/Neutral/Negative + confidence score) |
| **Vector Storage** | pgvector (Supabase extension) | Stores and queries embedding vectors within PostgreSQL |
| **Testing** | Jest + Testing Library (unit/integration); Cypress (end-to-end) | |
| **Deployment** | Vercel | Serverless Next.js deployment with automatic preview deployments and edge CDN *(Hobby tier cron limited to 1x/day; deadline reminders consolidated into a single daily evaluation)* |
| **CI/CD** | GitHub Actions | Automated test runs on pull requests; auto-deploy to Vercel on merge to main |

---

## System Architecture

IDSMS-CIS uses a **Modular Monolith** pattern within a single Next.js application. All functional modules reside in the same codebase but are organized as independently testable, loosely coupled feature modules.

### Architecture Layers

```text
Layer 1 — Client / Browser
├── React components — Vercel edge CDN
├── Desktop & mobile browser interfaces
└── Student UI / Faculty UI / Coordinator UI / Admin UI / SSE polling

Layer 2 — Next.js 14 Application Layer
├── App Router — page routing, SSR, server actions
├── API route handlers (/api/*)
├── Zod validation (shared schemas)
└── Service modules in /src/lib/services/:
    reportService.ts | checklistService.ts | companyService.ts
    aiService.ts | userService.ts | notificationService.ts
    documentService.ts | auditService.ts | calendarService.ts

Layer 3 — Authentication & RBAC
├── NextAuth.js v4.24.x — /src/middleware.ts intercepts every request
├── JWT (HttpOnly, Secure)
├── Session token validation with NEXTAUTH_SECRET
├── Route-level RBAC enforcement
├── First-login password redirect
└── Record-level ownership validated in service layer

Layer 4 — Data Layer
├── PostgreSQL 15 via Supabase
├── Prisma ORM (type-safe queries, schema-driven migrations)
├── Supabase Row Level Security (second enforcement layer, append-only for audit_logs)
└── pgvector $queryRaw (bound params) for similarity search

Layer 5 — Storage Layer              Layer 6 — AI & Notification Layer
├── Supabase Storage                 ├── Gemini API (text-embedding-004)
├── 8 access-controlled buckets      ├── Gemini 2.5 Flash (sentiment)
├── Time-limited signed URLs         ├── Resend (transactional email)
└── MIME-type validated uploads      └── Vercel Cron Jobs (scheduled notifications)

External Services:
Vercel (CDN/serverless) | Supabase (DB/Storage/RLS) | Gemini API | Resend | Puppeteer (@sparticuz/chromium) | GitHub Actions
```

### Folder Structure Convention

```text
/src
  /app                    # Next.js App Router pages and layouts
  /components             # Shared UI components
  /lib
    /services             # All business logic (never in pages/routes)
      reportService.ts
      checklistService.ts
      companyService.ts
      aiService.ts
      userService.ts
      notificationService.ts
      documentService.ts
      auditService.ts
      calendarService.ts
    /utils                # Utility functions
    /validators           # Zod schemas
  /types                  # TypeScript type definitions
  middleware.ts           # NextAuth RBAC middleware (intercepts all requests)
```

---

## Database Schema

16 tables, all primary keys as UUIDs, all tables include `createdAt`/`updatedAt` timestamps, soft deletes via nullable `deletedAt`/`archivedAt` fields.

| Table | Key Fields |
|---|---|
| `users` | id (UUID), hashedPassword, role, isActive, deletedAt, createdAt |
| `student_profiles` | id, userId, studentNumber, program (BSIT/BSCS/BMMA), classGroupId, semesterId, companyId, scheduleId, requiredHours, renderedHours, internshipFaceType, internshipStartDate |
| `class_groups` | id, name, startDate, endDate, program, classType, deletedAt |
| **`faculty_class_groups`** *(NEW)* | id (UUID), facultyId (FK to users), classGroupId (FK to class_groups), semesterId (FK to semesters). *Enables many-to-many relationship for faculty overseeing multiple groups.* |
| `semesters` | id, name, startDate, endDate, academicYear, isActive, archivedAt |
| `companies` | id, name, address, workModality, supervisorName, supervisorContact, isVerified, deletedAt |
| `moa_records` | id, companyId, documentUrl, status (Drafting→Archived), validFrom, validTo, programsCovered, archivedAt |
| `pre_deployment_checklist_items` | id, studentProfileId, requirementType (9 types), status (Pending/Approved/Returned), fileUrl, reviewerId, reviewDate, comments, archivedAt |
| `work_plans` | id, studentProfileId, status, plannedTasks, scheduleConfig, scheduleChangeHistory, approvalMetadata, coordinatorId |
| `weekly_reports` | id, studentProfileId, weekStart, weekEnd, totalHours, runningTotal, remainingHours, status (Pending/Approved/Returned/Regarded/Disregarded), facultyAction, revisionHistory, similarityScore, similarityFlag, sentimentLabel, sentimentConfidence, aiProcessedAt |
| `daily_report_entries` | id, weeklyReportId, reportDate, attendanceStatus, scheduledHours, actualHours, accomplishments (text), toolsUsed, embeddingVector (pgvector) |
| `deviation_reports` | id, studentProfileId, date, deviationType (Absence/Overtime/Undertime), reason, proofUrl, validationStatus, facultyId |
| `generated_documents` | id, studentProfileId, documentType (EndorsementLetter/WeeklyReport/MonthlyReport/FinalReportCover), fileUrl, referenceCode, generatedAt, status (pending_draft/generated/failed) |
| `notifications` | id, userId, triggerType, channel (email/in-app), status (sent/pending/failed), payload, sentAt |
| `audit_logs` | id, userId, action, entityType, entityId, ipAddress, timestamp, detail (immutable, append-only RLS) |
| `holiday_calendar` | id, date, name, holidayType (National/Regional), semesterId, studentProfileId (nullable, for company-specific) |
| `system_config` | id, configKey, configValue, updatedAt, updatedBy |

---

## Sprint Development Plan

### Sprint 1 — Authentication & User Management
**Focus:** Core identity and access foundation  
**Deliverable:** Working login system with RBAC middleware; role-gated navigation and dashboards for all four user roles; student profile screens; first-login password change flow; password reset flow.
- User registration (CSV/Excel bulk import of students)
- RBAC (Four roles with distinct UI and API access gates, including `faculty_class_groups` junction logic)
- Session management (Auto-expiry after configurable inactivity period)
- First-login enforcement (Forced password change before accessing any feature)
- Student profile setup (Program, class group, semester linkage)
- MFA (OTP/email-based multi-factor authentication support)
- Audit logging (Immutable log for login attempts and role events)
- Password Reset Flow (Magic link, 1-hour expiry)

### Sprint 2 — Company, MOA & Pre-Deployment
**Focus:** Pre-deployment compliance workflow  
**Deliverable:** Complete pre-deployment workflow from student login to endorsement readiness; company/MOA module with expiry alerts; checklist submission and faculty approval workflows; strict endorsement letter lock enforcement.
- Company profile registration (Autocomplete, duplicate detection)
- MOA record management (PDF/Drive upload, validity, programs, stage tracking)
- MOA expiry alerts (Automated email + in-app alerts to coordinator)
- Pre-deployment checklist (Nine documents per student, approve/return/comment per item)
- Work plan submission (Institutional template, coordinator review workflow)
- Endorsement letter gating (Blocked until all nine checklist items approved; work plan approval only queues `pending_draft`)

### Sprint 3 — Deployment Phase: Attendance, Reports & Calendar
**Focus:** Active deployment workflows and timeline tracking  
**Deliverable:** Complete deployment-phase workflow; calendar-based attendance log; automated hours progress dashboard; structured weekly/monthly report submission and faculty review screens; Unified Calendar integration.
- Schedule configuration (Fixed work schedule post-work-plan approval)
- Schedule change handling (Mid-internship schedule change workflow with Faculty/Coordinator approval)
- Calendar-based attendance (PH national/regional holidays, company non-working days)
- Deviation reports (Absence/overtime/undertime with proof + faculty validation)
- Automated hour computation (Total rendered, remaining, projected completion)
- Weekly report submission (Auto-populated forms, client-side copy-paste detection)
- Monthly report aggregation (Aggregated by calendar month, requires Approved/Regarded weekly reports)
- Faculty review workflow (Approve/Return/Regard/Disregard with email triggers)
- Unified Calendar views for all roles (Deadlines, holidays, projected completion dates)

### Sprint 4 — AI Integration, Documents, Dashboard & Archiving
**Focus:** Intelligence layer, full dashboards, notifications, archiving  
**Deliverable:** Fully integrated system with AI-assisted faculty review; automated PDF document generation with reference codes and failure recovery; real-time compliance dashboards for all roles; notification system; semester archive module; system ready for UAT.
- Similarity detection (Gemini `text-embedding-004` + pgvector, 0.70 threshold, cached)
- Sentiment analysis (Gemini 2.5 Flash, Positive/Neutral/Negative + confidence)
- PDF generation (Puppeteer — endorsement letters, weekly/monthly reports, final cover — with reference codes and retry logic)
- Compliance dashboards (Per-student hours, checklist %, submission status, anomaly flags)
- Notification system (12 triggers via Resend, consolidated daily Vercel Cron Jobs)
- Semester archiving (End-of-semester archive + full audit logging)
- Excel/CSV export (Compliance summaries, hours, checklists, flagged students)
- DSAR workflow and file retention/cleanup job configuration

---

## UI/UX Specifications & Screen Inventory

> **Note to frontend agents:** Each screen below defines the visible components, data displayed, pre-conditions, process flow, and documents produced. Use these specifications as the source of truth for component design. The color-coded status language used throughout the system is: **Green = Approved/Active**, **Yellow = Pending**, **Red = Returned/Overdue/Expired**, **Blue = Linked/System-tracked**, **Gray = Not Yet Submitted/Locked**.

### Authentication

#### Screen: Login Page (`/login`)
- **Layout:** Left panel (IDSMS logo, system full name, institution name, dark navy branding). Right panel ("Sign in to IDSMS" header, SLU Email Address input, Password input with show/hide toggle, "Forgot password?" link, "Log in to IDSMS" CTA button, first-time login helper text, security notice footer badges: "MFA Enabled", "DPA 2012 Compliant", "SLU Official Platform").
- **Security notices inline:** "Account locked after 5 failed attempts · Session expires after 30 min of inactivity."
- **Pre-conditions:** Active IDSMS account assigned by System Administrator; valid SLU institutional email; initial credentials sent via email; system live and accessible.
- **Process:** User enters credentials → System validates → MFA prompt (if enabled) → Redirect to role-specific dashboard. Failed attempts increment lockout counter.

#### Screen: Password Reset (`/auth/reset-password`) *(NEW)*
- **Layout:** "Reset Password" header, SLU Email input, "Send Reset Link" CTA.
- **Process:** User enters email → System checks if active → Sends 1-hour magic link → User clicks link → Enters new password (enforcing complexity rules) → Account unlocked (if lockout timer has passed) → Redirect to login.

### Student Role Screens

#### Screen: Student Dashboard (`/student/dashboard`)
- **Layout:** Header (Program badge, company name, work modality, academic year/semester). Three KPI cards: HOURS RENDERED, PRE-DEPLOYMENT DOCS, EST. COMPLETION. Main area (two columns): Left (Pre-Deployment Requirements table), Right (Weekly Reports table).
- **Pre-conditions:** Student logged in with Student/Intern role. Internship details configured.
- **Process:** Student reviews pending items and uses quick-action buttons. Endorsement Letter status shown as locked if items are pending.

#### Screen: My Documents (`/student/documents`)
- **Layout:** Summary header (Documents Complete, Last Upload, Endorsement Letter lock status). Pre-Deployment Requirements table (9 items with checkbox, REQUIREMENT name, SUBMITTED date, TYPE, STATUS, ACTION).
- **Pre-conditions:** Student authenticated and enrolled in active internship semester.
- **Process:** Student uploads/re-uploads Pending/Returned items. System refreshes checklist progress and notifies faculty.

#### Screen: Weekly Reports (`/student/reports/weekly`)
- **Layout:** Report info (auto-filled, read-only). Daily Accomplishments section (collapsible rows per working day: date, time range, hours, attendance radio, accomplishment text area, tools used). AI Quality Assessment panel (Similarity, Descriptions, Sentiment, Disclaimer). Footer (HOURS THIS WEEK, RUNNING TOTAL, REMAINING, Cancel, Preview PDF, Submit Report).
- **Pre-conditions:** Student logged in, current week's report period open, not already submitted.
- **Process:** Student fills daily activities → Client-side copy-paste check runs → AI tool runs similarity/sentiment check → Student reviews AI panel → Previews PDF → Submits.

#### Screen: Attendance Log (`/student/attendance`)
- **Layout:** Summary cards (Days Present, Absences, Holidays, Overtime Days). Filter tabs. Attendance table (grouped by week: DATE, STATUS, SCHED., ACTUAL, DEVIATION, NOTE, VALIDATED). Export CSV button.
- **Pre-conditions:** Student logged in. At least one weekly report submitted and validated.

#### Screen: Student Calendar (`/student/calendar`) *(NEW)*
- **Layout:** Full-month calendar view.
- **Events:** Red dots for Report Deadlines, Gray blocks for Holidays, Yellow blocks for Approved Deviations.
- **Prominent Banner:** "Projected OJT Completion: [Date] (On Track)" calculated dynamically based on rendered hours and approved schedule.

#### Screen: My Profile (`/student/profile`) & Settings (`/student/settings`)
- **Layout:** Personal Information, Internship Assignment (read-only), Notification Preferences, Email Notifications toggles, Security (Password update), Display preferences. DSAR "Request my data" button in Settings.

### Faculty Adviser Role Screens

#### Screen: Faculty Dashboard (`/faculty/dashboard`)
- **Layout:** KPI row (Total Students, Submitted This Week, Pending Review, Not Yet Submitted). Class group tabs. Student compliance table (#, STUDENT, HOURS PROGRESS, DOCS, WK REPORT, AI FLAG, ACTION). Bulk actions (Export, Bulk Endorse).

#### Screen: Class Groups (`/faculty/class-groups`)
- **Layout:** Group cards (Group name, student count, program, required hours, active count, flagged count, average compliance %). Expanded student directory table.

#### Screen: Report Review (`/faculty/reports/review/[reportId]`)
- **Layout:** Report header. Daily Entries (left column). AI Quality Assessment panel (right column: vague indicator, similar phrasing detection, overall sentiment, hours match schedule, disclaimer). Your Review section (Revision note text area, Return button, Approve button). Student Info sidebar.
- **Process:** Faculty examines AI panel and entries. Approve (status → Approved) or Return (status → Returned, requires note). "Regard" and "Disregard" actions available per FR-WR-06.

#### Screen: Pre-Deployment Checklists (`/faculty/checklists`)
- **Layout:** Summary header. Filter tabs. Class group sub-tab. Checklist item table (STUDENT, DOCUMENT, SUBMITTED, PROGRESS, STATUS, ACTIONS).

#### Screen: Endorsement Letters (`/faculty/endorse-letters`)
- **Layout:** Summary cards (Generated, Ready to Generate, Blocked). Bulk endorsement bar. Student endorsement table (STUDENT, COMPANY, GENERATED, CHECKLIST, STATUS, ACTIONS).
- **Pre-conditions:** Student must have all 9 pre-deployment checklist items approved (9/9) to be eligible.

#### Screen: Faculty Calendar (`/faculty/calendar`) *(NEW)*
- **Layout:** Calendar view aggregating deadlines for all assigned `faculty_class_groups`. Highlights Tuesdays with high expected submission volumes across all assigned groups.

### Department Coordinator Role Screens

#### Screen: Department Compliance Dashboard (`/coordinator/dashboard`)
- **Layout:** Program KPI cards (BSIT, BSCS, BMMA counts + compliance %, MOA Expiring Soon count). MOA expiry alert banner. All Students Compliance Overview table (Filter controls, Export Excel button, columns: STUDENT ID, NAME, PROGRAM, COMPANY, HOURS, DOCS, WEEKLY RPT, STATUS).

#### Screen: Companies & MOA (`/coordinator/companies`)
- **Layout:** Summary cards. MOA expiry alert banner. All Partner Companies table (COMPANY, MODALITY, INTERNS, MOA VALID TO, PROGRAMS, STATUS, ACTIONS). "+ Add Company" button.

#### Screen: Work Plans (`/coordinator/work-plans`)
- **Layout:** Summary cards (Pending Approval, Approved & Locked, Returned for Revision). Pending Work Plan Reviews table. Recently Approved section.

#### Screen: Reports & Export (`/coordinator/reports`)
- **Layout:** Export Builder (left). Quick Export Templates (right: Compliance Master List, Hours Summary, Checklist Status, Flagged Students). Recent Export History table.

#### Screen: Coordinator Calendar (`/coordinator/calendar`) *(NEW)*
- **Layout:** Calendar view showing department-wide milestones. Events: MOA Expiration warnings (Orange), Clustered Projected Completion Dates (Green) to anticipate endorsement letter generation spikes.

### Super Admin Role Screens

#### Screen: System Settings (`/admin/system-settings`)
- **Layout:** Required Hours Configuration. User Management Table. Audit Log (Filter and Export buttons). Semester Management.

#### Screen: Role Assignments (`/admin/role-assignments`)
- **Layout:** Summary bar. Filter tabs. All Users table. Note banner regarding immutable audit logging.

#### Screen: Holiday Calendar (`/admin/holiday-calendar`)
- **Layout:** Holiday List table. Calendar widget. Calendar Settings (Applicable Semester dropdown, Auto-populate toggle, Save button). "+ Add Holiday" button.

#### Screen: Export Center (`/admin/export-center`)
- **Layout:** MFA Requirement banner. Bulk Export — All Data (6 export cards: All Students & Compliance, All Weekly Reports, Audit Log Export, All Company & MOA Records, User Accounts List, AI Flag Summary). Audit Log table.

#### Screen: Settings — Super Admin (`/admin/settings`)
- **Layout:** Notification Intervals. AI Module Settings (Similarity threshold, quality feedback toggle, sentiment tracking toggle). Security (Session timeout).

---

## Acceptance Criteria

### Authentication & Access Control
- [ ] A student can log in using their SLU institutional email and system-generated default password.
- [ ] The system forces a password change on first login before any other action is possible.
- [ ] A user can successfully request a password reset via magic link, which expires in 1 hour.
- [ ] A student cannot access another student's reports, documents, or profile — even with a crafted API request.
- [ ] A faculty adviser can only see students linked to them via the `faculty_class_groups` junction table.
- [ ] A coordinator can see all students across all programs for their department.
- [ ] MFA challenge is presented when configured for sensitive operations.
- [ ] Accounts lock after 5 consecutive failed login attempts.
- [ ] All login attempts and role changes are recorded in the immutable audit log.

### Pre-Deployment Compliance
- [ ] A student's endorsement letter cannot be generated until all 9 pre-deployment checklist items have status "Approved". Work plan approval only creates a `pending_draft` record.
- [ ] Each checklist item can be individually approved or returned (with comments) by the faculty adviser.
- [ ] Student checklist completion percentage updates in real time.
- [ ] MOA records display correct lifecycle stage and trigger expiry alerts at the configured threshold.

### Weekly Reports & AI
- [ ] Weekly report forms are auto-populated based on the student's approved schedule and semester calendar.
- [ ] Client-side copy-paste detection blocks submission if text exactly matches the prior week, requiring student revision.
- [ ] Server-side vector similarity (Gemini `text-embedding-004`) correctly flags reports with similarity score ≥ 0.70 as advisory indicators on the faculty review page.
- [ ] Sentiment analysis output (Positive/Neutral/Negative + confidence) is displayed inline on the faculty review page.
- [ ] AI results are served from cache on page load — no live API call is made during page render.
- [ ] AI flags do not prevent report approval or rejection — all decisions remain with faculty.
- [ ] Monthly reports can only be submitted when all constituent weekly reports for that calendar month are "Approved" or "Regarded".

### Hour Computation & Schedule
- [ ] Total hours rendered, remaining hours, and projected completion date update automatically after each validated weekly report and deviation report.
- [ ] Only validated deviation reports affect hour computation.
- [ ] Approved schedule changes do not retroactively alter previously validated hours; they only affect future computation and update the projected completion date.
- [ ] Required hours per program are configurable from the admin UI and not hardcoded.

### Document Generation & Storage
- [ ] Generated endorsement letters include: student name, ID number, company name and address, supervisor name and position, endorsement date, institution letterhead.
- [ ] All generated PDFs include a system-generated reference code and timestamp.
- [ ] Puppeteer-generated PDFs render consistently across Chrome, Firefox, and Safari.
- [ ] Bulk PDF export for a class group produces a downloadable ZIP archive.
- [ ] If PDF generation fails, the system logs the error, sets status to `failed`, and provides a "Regenerate" button (max 3 retries).
- [ ] File uploads are strictly limited to 5MB (PDF) and 2MB (Images) to manage Supabase free-tier limits.

### Notifications
- [ ] All 12 notification trigger events fire correctly.
- [ ] Notification interval values are configurable via Super Admin settings and take effect without a code deployment.

### Data Privacy & Security
- [ ] All uploaded files are inaccessible without a valid, time-limited signed URL.
- [ ] MIME-type validation rejects uploads outside the allowed file types.
- [ ] All client-server communication is over HTTPS/TLS 1.2+.
- [ ] Student health documents are accessible only to assigned faculty and coordinators.
- [ ] Soft deletes are implemented — no records are permanently deleted; all are recoverable for audit.
- [ ] A student can trigger a DSAR from Settings, which logs a ticket and notifies the Super Admin.
- [ ] The `audit_logs` table cannot be updated or deleted by any user or service role (append-only RLS enforced).

### UAT Task Scenarios
- [ ] Student can complete full pre-deployment flow: login → change password → upload all 9 documents → have all approved → endorsement letter generated.
- [ ] Faculty can: review a weekly report with AI flags visible → add a revision note → return the report → student notified.
- [ ] Faculty can use the "Regard" action on a report, which counts the hours but flags it for minor improvement without requiring student revision.
- [ ] Coordinator can: approve a work plan → verify endorsement letter lock releases → export compliance report to Excel.
- [ ] Super Admin can: change required hours for BSIT → archive current semester → bulk export audit log with MFA confirmation.
- [ ] Student can view their Unified Calendar and see their dynamically updating "Projected OJT Completion Date."

---

## Testing Strategy

### Unit Testing (Jest + Testing Library)
- Individual service functions: `checklistService.ts` (item status updates, endorsement gating), `hourComputationService.ts` (rendered hours, projected date), `reportService.ts` (validation, status transitions), `moaService.ts` (stage transitions, expiry detection), `notificationService.ts` (trigger firing), `aiService.ts` (result caching, similarity threshold).

### Integration Testing (Jest)
- Approved work plan → weekly report schedule auto-generation.
- Validated deviation report → hour computation update.
- All 9 checklist items approved → endorsement letter unlock.
- MOA stage change → coordinator notification trigger.
- `faculty_class_groups` RBAC logic validation.

### End-to-End Testing (Cypress)
- Full student pre-deployment flow.
- Faculty weekly report review with AI panel.
- Coordinator work plan approval.
- Super Admin system configuration.
- Append-only audit log RLS verification.

### Performance Testing
- Page load times (p95 TTFB ≤ 800ms) under simulated concurrent academic-hour load (50 users).
- PDF generation speed, consistency, and failure/retry mechanism validation.
- AI similarity/sentiment processing time during Tuesday peak submission window.
- Bulk export generation with 100+ student dataset (async queue validation).

### User Acceptance Testing (UAT)
- Guided task scenarios with selected student interns, faculty advisers, and coordinators.
- Feedback recorded and incorporated before sprint is considered complete.
- Evaluation criteria: ease of use, dashboard clarity, status indicator accuracy, reduction vs. Google Classroom baseline, export usefulness, overall satisfaction.

---

## Ethical Considerations

- All AI features are explicitly advisory only. Sentiment analysis and similarity detection outputs must never be used as the sole basis for grading, approval, or rejection decisions.
- Students must provide explicit informed consent to AI-assisted analysis of their submitted documents, logged during the orientation flow, in accordance with RA 10173.
- Role-based access control ensures students can only see their own records; faculty see only assigned students; coordinators see only their department.
- All communications are SSL-encrypted. Personal documents (medical, psychological, parental consent) are encrypted at rest.
- The system will not be used to track students beyond the scope of internship compliance management.

---

## Constraints

- Capstone project context: developed by an 8-person fourth-year team; architecture must avoid operational overhead of full microservices.
- **Storage Constraint:** Supabase free tier (1GB) will be actively monitored. File size caps (5MB PDF, 2MB Image) are enforced. At 800MB consumed, the Super Admin will receive an alert to consider a tier upgrade or manual archival.
- **Vercel Cron Constraint:** Hobby tier allows only 1 cron run per day. Deadline reminders (48h/24h) are consolidated into a single daily cron job that evaluates upcoming deadlines, rather than two separate cron triggers.
- Institutional stakeholders (faculty, coordinators, student interns) are not available for sprint review sessions throughout development; adviser-guided milestone checkpoints replace standard Scrum sprint reviews.
- System must deploy as a single project (modular monolith); independent microservice hosting is out of scope for v1.0.
- Puppeteer on Vercel requires `@sparticuz/chromium` — cold start latency for PDF generation must be acknowledged in performance planning and mitigated via async retry logic.

---

## Dependencies

| Dependency | Purpose | Risk & Mitigation |
|---|---|---|
| Supabase (PostgreSQL 15 + pgvector + Storage + RLS) | Primary database, vector search, file storage, row-level security | **Risk:** Free tier row/storage limits. **Mitigation:** Strict file size caps (5MB/2MB), quarterly cleanup job (NFR-DP-08), upgrade alert at 800MB. |
| Next.js 14 (App Router) | Full-stack framework | **Risk:** Breaking changes. **Mitigation:** Strict adherence to App Router patterns; no Pages Router mixing. |
| Gemini API (`text-embedding-004` + 2.5 Flash) | AI embeddings and sentiment analysis | **Risk:** Rate limits. **Mitigation:** Async queuing post-submission; no live API calls on page load. |
| Puppeteer / `@sparticuz/chromium` | Server-side PDF generation | **Risk:** Cold start latency/timeouts. **Mitigation:** FR-DG-07 retry logic with exponential backoff; async processing. |
| Resend | Transactional email delivery | **Risk:** 100 emails/day free tier limit. **Mitigation:** Batch notifications where possible; daily usage monitoring. |
| Vercel | Deployment, CDN, Cron Jobs | **Risk:** 1x/day cron limit on Hobby tier. **Mitigation:** Consolidate 48h/24h reminder logic into a single daily evaluation cron. |
| **NextAuth.js v4.24.x** | Authentication, session management, RBAC | **Risk:** v5 (Auth.js) breaking changes. **Mitigation:** Explicitly pinned to v4.24.x in `package.json`. |
| Prisma | ORM, schema migrations | **Risk:** pgvector requires custom setup. **Mitigation:** Documented raw SQL migration (`CREATE EXTENSION vector`) required before `prisma generate`. |
| GitHub Actions | CI/CD pipeline | **Risk:** Network access to Vercel deployment API. **Mitigation:** Standard Vercel GitHub integration. |

---

## Notes and References

### Related Prior Systems (Comparative Context)
| System | Institution/Source | Key Features | Gap IDSMS Addresses |
|---|---|---|---|
| Web-Based Student Internship Portal | Health colleges, Saudi Arabia (Alsolais, 2022) | Online submission, supervisor assignment, status monitoring | No AI review, no MOA monitoring, no hour computation |
| Internship Monitoring and Supervising Web-Based System | Universitas Nasional (Jaafar et al., 2017) | Schedule monitoring, supervisor assignment, progress reporting | No document creation or pre-deployment checklist enforcement |
| Student Internship Attendance Application System | Indonesian University (Nurfaizi & Hindarto, 2023) | Automated hour computation, web-based attendance tracking | Attendance only; no report management or compliance monitoring |
| Electronic Document and Records Management System | Public sector, St. Vincent & the Grenadines (John, 2023) | Access control, audit logging, centralized document storage | Not internship-specific; no dashboard or workflow enforcement |
| Google Classroom (current SLU setup) | Saint Louis University SAMCIS | Assignment submission, file uploading, basic communication | No MOA management, no hours calculation, no compliance monitoring |

### Regulatory Reference
- **CHED CMO No. 104, Series of 2017** — Student Internship Program in the Philippines (SIPP): governing framework for all internship requirements, documentation, supervision, and compliance.
- **Republic Act No. 10173** — Data Privacy Act of 2012: governs collection, storage, and processing of personal data, including health and psychological records.

### Academic References
- Alsolais (2022) — centralized portals reduce administrative burden and improve communication vs. manual processes.
- Jaafar et al. (2017) — purpose-built systems outperform general-purpose tools for internship management.
- Nurfaizi & Hindarto (2023) — web-based attendance monitoring reduces computation errors.
- Dewi & Hanifah (2024) — web-based internship monitoring system achieved 87.53% user satisfaction score in UAT.
- Russell & Norvig (2021); Madanchian & Taherdoost (2023) — NLP tools (sentiment analysis, similarity detection) in educational document management.
- Tan et al. (2023); Munezero et al. (2013) — sentiment analysis utility in educational settings for student engagement and welfare monitoring.
- Kumar & Saxena (2024) — adviser-as-proxy model for academic software development, supporting the adapted Agile approach used in this project.

---

*End of IDSMS-CIS Product Requirements Document v1.1*
```

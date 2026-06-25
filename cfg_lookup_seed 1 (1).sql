/* ============================================================================
   DED.ConfigService — Lookup & Rule seed data  (UAE / Dubai DED context)
   Target DB : DED_ConfigService   |   Schema: cfg
   ----------------------------------------------------------------------------
   Direct-insert equivalent of ConfigServiceDataSeeder. Seeds the 10 lookup
   tables + 4 rule tables of the config-lookup service with the SAME values the
   C# seeder produces, so either path yields a consistent dataset.

   - Explicit UIDs + SET IDENTITY_INSERT so foreign keys are deterministic.
   - Idempotent: every row is guarded with IF NOT EXISTS, so re-running is safe.
   - ABP audit columns (ExtraProperties, ConcurrencyStamp, CreationTime,
     IsDeleted) are populated to satisfy the FullAuditedAggregateRoot shape.
   - Legacy DescriptionArabic/DescriptionEnglish columns on Activities /
     ActivityGroups have a DB default of '' and are intentionally omitted.

   Severity storage (matches the EF value conversions):
     * Activities.SeverityLevel  -> enum NAME  ('Low' | 'Medium' | 'High')
     * Approvals.SeverityLevelId -> enum VALUE (Low=1, Medium=2, High=3)
   ============================================================================ */

SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRANSACTION;

DECLARE @now datetime2(7) = SYSUTCDATETIME();
DECLARE @ex  nvarchar(max) = N'{}';   -- ExtraProperties (ABP)

/* ===========================================================================
   1) BusinessDomains
   =========================================================================== */
SET IDENTITY_INSERT cfg.BusinessDomains ON;
INSERT INTO cfg.BusinessDomains
      (BusinessDomain_UID, ExtraProperties, ConcurrencyStamp, CreationTime, IsDeleted,
       BusinessDomain_Arabic, BusinessDomain_English, BusinessDomain_StatusCode)
SELECT v.id, @ex, CONVERT(nvarchar(40), NEWID()), @now, 0, v.ar, v.en, v.status
FROM (VALUES
      (1, N'تجارة',                      N'Trade',                                   N'ACTIVE'),
      (2, N'صناعة',                      N'Industry',                                N'ACTIVE'),
      (3, N'خدمات مهنية',                N'Professional Services',                   N'ACTIVE'),
      (4, N'سياحة وضيافة',               N'Tourism & Hospitality',                   N'ACTIVE'),
      (5, N'إنشاءات ومقاولات',           N'Construction & Contracting',              N'ACTIVE'),
      (6, N'تقنية المعلومات والاتصالات', N'Information & Communications Technology', N'ACTIVE'),
      (7, N'النقل والخدمات اللوجستية',   N'Transport & Logistics',                   N'ACTIVE'),
      (8, N'الرعاية الصحية',             N'Healthcare',                              N'ACTIVE')
     ) AS v(id, ar, en, status)
WHERE NOT EXISTS (SELECT 1 FROM cfg.BusinessDomains b WHERE b.BusinessDomain_UID = v.id);
SET IDENTITY_INSERT cfg.BusinessDomains OFF;

/* ===========================================================================
   2) Nationalities
   =========================================================================== */
SET IDENTITY_INSERT cfg.Nationalities ON;
INSERT INTO cfg.Nationalities
      (Nationality_UID, ExtraProperties, ConcurrencyStamp, CreationTime, IsDeleted,
       Nationality_Arabic, Nationality_English)
SELECT v.id, @ex, CONVERT(nvarchar(40), NEWID()), @now, 0, v.ar, v.en
FROM (VALUES
      ( 1, N'الإمارات العربية المتحدة',  N'United Arab Emirates'),
      ( 2, N'مصر',                       N'Egypt'),
      ( 3, N'المملكة العربية السعودية',  N'Saudi Arabia'),
      ( 4, N'الكويت',                    N'Kuwait'),
      ( 5, N'الأردن',                    N'Jordan'),
      ( 6, N'الهند',                     N'India'),
      ( 7, N'باكستان',                   N'Pakistan'),
      ( 8, N'المملكة المتحدة',           N'United Kingdom'),
      ( 9, N'الولايات المتحدة الأمريكية', N'United States'),
      (10, N'الفلبين',                   N'Philippines')
     ) AS v(id, ar, en)
WHERE NOT EXISTS (SELECT 1 FROM cfg.Nationalities n WHERE n.Nationality_UID = v.id);
SET IDENTITY_INSERT cfg.Nationalities OFF;

/* ===========================================================================
   3) LegalForms
   =========================================================================== */
SET IDENTITY_INSERT cfg.LegalForms ON;
INSERT INTO cfg.LegalForms
      (LegalForm_UID, ExtraProperties, ConcurrencyStamp, CreationTime, IsDeleted,
       LegalForm_Arabic, LegalForm_English)
SELECT v.id, @ex, CONVERT(nvarchar(40), NEWID()), @now, 0, v.ar, v.en
FROM (VALUES
      ( 1, N'جمعية تعاونية',               N'Cooperative Association'),
      ( 2, N'شركة أعمال',                  N'Business Company'),
      ( 3, N'شركة تضامنية',                N'Partnership Company'),
      ( 4, N'شركة توصية بسيطة',            N'Simple Limited Partnership'),
      ( 5, N'شركة ذات مسئولية محدودة',     N'Limited Liability Company'),
      ( 6, N'شركة مساهمة خاصة',            N'Private Joint Stock Company'),
      ( 7, N'شركة مساهمة عامة',            N'Public Joint Stock Company'),
      ( 8, N'فرع شركة أجنبية',             N'Branch of Foreign Company'),
      ( 9, N'فرع شركة خليجية',             N'Branch of Gulf Company'),
      (10, N'مركبة منطقة حرية',            N'Free Zone Vehicle'),
      (11, N'مؤسسة فردية',                 N'Sole Establishment'),
      (12, N'د.م.م. (شركة الشخص الواحد)',  N'One Person Company LLC'),
      (13, N'شركة حكومية',                 N'Government Company'),
      (14, N'مؤسسة حكومية',                N'Government Institution'),
      (15, N'فرع محلي',                    N'Local Branch'),
      (16, N'فرع إماراتي',                 N'Emirati Branch'),
      (17, N'شركة مهنية',                  N'Professional Company'),
      (18, N'منشأة في منطقة حرة مالية',    N'Financial Free Zone Entity')
     ) AS v(id, ar, en)
WHERE NOT EXISTS (SELECT 1 FROM cfg.LegalForms l WHERE l.LegalForm_UID = v.id);
SET IDENTITY_INSERT cfg.LegalForms OFF;

/* ===========================================================================
   4) RequestPurposes
   =========================================================================== */
SET IDENTITY_INSERT cfg.RequestPurposes ON;
INSERT INTO cfg.RequestPurposes
      (RequestPurpose_UID, ExtraProperties, ConcurrencyStamp, CreationTime, IsDeleted,
       RequestPurpose_Arabic, RequestPurpose_English)
SELECT v.id, @ex, CONVERT(nvarchar(40), NEWID()), @now, 0, v.ar, v.en
FROM (VALUES
      (1, N'رخصة جديدة',            N'New License'),
      (2, N'فرع منشأة محلية',       N'Local Establishment Branch'),
      (3, N'فرع منشأة غير محلية',   N'Non-Local Establishment Branch'),
      (4, N'فرع منشأة أجنبية',      N'Foreign Establishment Branch'),
      (5, N'تجديد رخصة',            N'License Renewal'),
      (6, N'تعديل النشاط التجاري',  N'Amend Business Activity'),
      (7, N'تغيير الاسم التجاري',   N'Change Trade Name')
     ) AS v(id, ar, en)
WHERE NOT EXISTS (SELECT 1 FROM cfg.RequestPurposes r WHERE r.RequestPurpose_UID = v.id);
SET IDENTITY_INSERT cfg.RequestPurposes OFF;

/* ===========================================================================
   5) EntityTypes
   =========================================================================== */
SET IDENTITY_INSERT cfg.EntityTypes ON;
INSERT INTO cfg.EntityTypes
      (EntityType_UID, ExtraProperties, ConcurrencyStamp, CreationTime, IsDeleted,
       EntityType_Arabic, EntityType_English)
SELECT v.id, @ex, CONVERT(nvarchar(40), NEWID()), @now, 0, v.ar, v.en
FROM (VALUES
      (1, N'جهة اتحادية',      N'Federal Authority'),
      (2, N'جهة محلية',        N'Local Authority'),
      (3, N'جهة خاصة',         N'Private Entity'),
      (4, N'منطقة حرة',        N'Free Zone Authority'),
      (5, N'جهة شبه حكومية',   N'Semi-Government Entity')
     ) AS v(id, ar, en)
WHERE NOT EXISTS (SELECT 1 FROM cfg.EntityTypes e WHERE e.EntityType_UID = v.id);
SET IDENTITY_INSERT cfg.EntityTypes OFF;

/* ===========================================================================
   6) ApprovalTypes
   =========================================================================== */
SET IDENTITY_INSERT cfg.ApprovalTypes ON;
INSERT INTO cfg.ApprovalTypes
      (ApprovalType_UID, ExtraProperties, ConcurrencyStamp, CreationTime, IsDeleted,
       ApprovalType_Arabic, ApprovalType_English)
SELECT v.id, @ex, CONVERT(nvarchar(40), NEWID()), @now, 0, v.ar, v.en
FROM (VALUES
      (1, N'موافقة مبدئية',         N'Preliminary Approval'),
      (2, N'موافقة نهائية',         N'Final Approval'),
      (3, N'ترخيص',                 N'License'),
      (4, N'تصريح أمني',            N'Security Clearance'),
      (5, N'شهادة عدم ممانعة',      N'No Objection Certificate'),
      (6, N'تصريح بيئي',            N'Environmental Permit')
     ) AS v(id, ar, en)
WHERE NOT EXISTS (SELECT 1 FROM cfg.ApprovalTypes a WHERE a.ApprovalType_UID = v.id);
SET IDENTITY_INSERT cfg.ApprovalTypes OFF;

/* ===========================================================================
   7) ActivityGroups  (FK -> BusinessDomains)
   =========================================================================== */
SET IDENTITY_INSERT cfg.ActivityGroups ON;
INSERT INTO cfg.ActivityGroups
      (ActivityGroup_UID, ExtraProperties, ConcurrencyStamp, CreationTime, IsDeleted,
       ActivityGroup_Arabic, ActivityGroup_English, BusinessDomainUid)
SELECT v.id, @ex, CONVERT(nvarchar(40), NEWID()), @now, 0, v.ar, v.en, v.bd
FROM (VALUES
      ( 1, N'تجارة عامة',              N'General Trading',            1),  -- Trade
      ( 2, N'تجارة التجزئة',           N'Retail Trade',               1),  -- Trade
      ( 3, N'تجارة الجملة',            N'Wholesale Trade',            1),  -- Trade
      ( 4, N'الصناعات الغذائية',       N'Food Manufacturing',         2),  -- Industry
      ( 5, N'الاستشارات الإدارية',     N'Management Consultancy',     3),  -- Professional Services
      ( 6, N'خدمات المطاعم والمقاهي',  N'Restaurant & Café Services', 4),  -- Tourism & Hospitality
      ( 7, N'مقاولات المباني',         N'Building Contracting',       5),  -- Construction & Contracting
      ( 8, N'خدمات تقنية المعلومات',   N'IT Services',                6),  -- ICT
      ( 9, N'النقل البري',             N'Land Transport',             7),  -- Transport & Logistics
      (10, N'خدمات الشحن',             N'Freight Services',           7),  -- Transport & Logistics
      (11, N'العيادات الطبية',         N'Medical Clinics',            8),  -- Healthcare
      (12, N'الصناعات المعدنية',       N'Metal Industries',           2)   -- Industry
     ) AS v(id, ar, en, bd)
WHERE NOT EXISTS (SELECT 1 FROM cfg.ActivityGroups g WHERE g.ActivityGroup_UID = v.id);
SET IDENTITY_INSERT cfg.ActivityGroups OFF;

/* ===========================================================================
   8) Activities  (FK -> ActivityGroups; SeverityLevel = enum NAME)
   =========================================================================== */
SET IDENTITY_INSERT cfg.Activities ON;
INSERT INTO cfg.Activities
      (Activity_UID, ExtraProperties, ConcurrencyStamp, CreationTime, IsDeleted,
       Activity_Arabic, Activity_English, ActivityGroupUid, SeverityLevel)
SELECT v.id, @ex, CONVERT(nvarchar(40), NEWID()), @now, 0, v.ar, v.en, v.grp, v.sev
FROM (VALUES
      ( 1, N'بيع المواد الغذائية بالتجزئة', N'Retail sale of foodstuffs',          2, N'Low'),
      ( 2, N'خدمات استشارات إدارية',        N'Management consultancy',             5, N'Low'),
      ( 3, N'تجارة مواد البناء',            N'Trading in building materials',      3, N'Medium'),
      ( 4, N'خدمات تقنية المعلومات',        N'Information technology services',    8, N'Low'),
      ( 5, N'بيع الملابس والأقمشة',         N'Retail sale of clothing and textiles', 2, N'Low'),
      ( 6, N'بيع الأجهزة الإلكترونية',      N'Retail sale of electronics',         2, N'Low'),
      ( 7, N'تصنيع المخبوزات',              N'Manufacture of bakery products',     4, N'Medium'),
      ( 8, N'تشغيل المطاعم',                N'Restaurant operation',               6, N'Low'),
      ( 9, N'بناء المباني السكنية',         N'Construction of residential buildings', 7, N'High'),
      (10, N'خدمات النقل البري للبضائع',    N'Road freight transport services',    9, N'Medium'),
      (11, N'خدمات التخليص الجمركي',        N'Customs clearance services',        10, N'Medium'),
      (12, N'إدارة العيادات الطبية',        N'Medical clinic management',         11, N'High'),
      (13, N'تصنيع المنتجات المعدنية',      N'Manufacture of metal products',     12, N'High'),
      (14, N'تجارة الأسلحة والذخائر',       N'Trade of weapons and ammunition',    3, N'High')
     ) AS v(id, ar, en, grp, sev)
WHERE NOT EXISTS (SELECT 1 FROM cfg.Activities a WHERE a.Activity_UID = v.id);
SET IDENTITY_INSERT cfg.Activities OFF;

/* ===========================================================================
   9) EntityProvidingApprovals  (FK -> EntityTypes; optional self-parent)
   =========================================================================== */
SET IDENTITY_INSERT cfg.EntityProvidingApprovals ON;
INSERT INTO cfg.EntityProvidingApprovals
      (EntityProvidingApproval_UID, ExtraProperties, ConcurrencyStamp, CreationTime, IsDeleted,
       EntityProvidingApproval_Arabic, EntityProvidingApproval_English, EntityTypeUid, ParentEntityUid)
SELECT v.id, @ex, CONVERT(nvarchar(40), NEWID()), @now, 0, v.ar, v.en, v.etype, v.parent
FROM (VALUES
      (1, N'وزارة الاقتصاد',                  N'Ministry of Economy',                       1, CONVERT(int, NULL)),
      (2, N'بلدية دبي',                       N'Dubai Municipality',                        2, CONVERT(int, NULL)),
      (3, N'الإدارة العامة للدفاع المدني',    N'General Directorate of Civil Defence',      2, CONVERT(int, NULL)),
      (4, N'وزارة الداخلية',                  N'Ministry of Interior',                      1, CONVERT(int, NULL)),
      (5, N'إدارة الترخيص التجاري',           N'Commercial Licensing Department',           2, 2),  -- child of Dubai Municipality
      (6, N'هيئة الصحة بدبي',                 N'Dubai Health Authority',                    2, CONVERT(int, NULL)),
      (7, N'الهيئة الاتحادية للجمارك',        N'Federal Customs Authority',                 1, CONVERT(int, NULL)),
      (8, N'وزارة التغير المناخي والبيئة',    N'Ministry of Climate Change & Environment',  1, CONVERT(int, NULL)),
      (9, N'سلطة دبي للخدمات المالية',        N'Dubai Financial Services Authority',        4, CONVERT(int, NULL))
     ) AS v(id, ar, en, etype, parent)
WHERE NOT EXISTS (SELECT 1 FROM cfg.EntityProvidingApprovals e WHERE e.EntityProvidingApproval_UID = v.id);
SET IDENTITY_INSERT cfg.EntityProvidingApprovals OFF;

/* ===========================================================================
   ================================  RULES  ==================================
   =========================================================================== */

/* ---------------------------------------------------------------------------
   10) Approvals  (FK -> ApprovalTypes, EntityProvidingApprovals;
                   SeverityLevelId = enum VALUE 1/2/3)
   --------------------------------------------------------------------------- */
SET IDENTITY_INSERT cfg.Approvals ON;
INSERT INTO cfg.Approvals
      (Approval_UID, ExtraProperties, ConcurrencyStamp, CreationTime, IsDeleted,
       ApprovalTypeUid, RequesterEntityUid, SeverityLevelId, IsShowStopper)
SELECT v.id, @ex, CONVERT(nvarchar(40), NEWID()), @now, 0, v.atype, v.req, v.sev, v.stopper
FROM (VALUES
      (1, 4, 4, 3, 1),  -- Security Clearance        | Ministry of Interior | High   | show-stopper
      (2, 3, 2, 2, 1),  -- License                   | Dubai Municipality   | Medium | show-stopper
      (3, 1, 1, 1, 0),  -- Preliminary Approval      | Ministry of Economy  | Low
      (4, 3, 3, 2, 0),  -- License                   | Civil Defence        | Medium
      (5, 5, 6, 2, 1),  -- No Objection Certificate  | Dubai Health Auth.   | Medium | show-stopper
      (6, 3, 7, 2, 0),  -- License                   | Federal Customs Auth.| Medium
      (7, 6, 8, 3, 1),  -- Environmental Permit      | MOCCAE               | High   | show-stopper
      (8, 2, 9, 3, 1)   -- Final Approval            | DFSA                 | High   | show-stopper
     ) AS v(id, atype, req, sev, stopper)
WHERE NOT EXISTS (SELECT 1 FROM cfg.Approvals a WHERE a.Approval_UID = v.id);
SET IDENTITY_INSERT cfg.Approvals OFF;

/* ---------------------------------------------------------------------------
   11) ActivityApprovals  (Activity <-> Approval)
   --------------------------------------------------------------------------- */
SET IDENTITY_INSERT cfg.ActivityApprovals ON;
INSERT INTO cfg.ActivityApprovals
      (ActivityApproval_UID, ExtraProperties, ConcurrencyStamp, CreationTime, IsDeleted,
       ActivityUid, ApprovalUid)
SELECT v.id, @ex, CONVERT(nvarchar(40), NEWID()), @now, 0, v.act, v.app
FROM (VALUES
      ( 1,  1, 2),  -- Retail sale of foodstuffs     -> Dubai Municipality License
      ( 2,  3, 4),  -- Trading in building materials -> Civil Defence License
      ( 3,  4, 3),  -- IT services                   -> Preliminary Approval
      ( 4,  2, 3),  -- Management consultancy        -> Preliminary Approval
      ( 5,  7, 5),  -- Bakery manufacturing          -> DHA No Objection Certificate
      ( 6,  8, 5),  -- Restaurant operation          -> DHA No Objection Certificate
      ( 7,  9, 4),  -- Residential building          -> Civil Defence License
      ( 8, 11, 6),  -- Customs clearance             -> Federal Customs License
      ( 9, 13, 7),  -- Metal products manufacturing  -> Environmental Permit
      (10, 14, 1)   -- Weapons trade                 -> Security Clearance
     ) AS v(id, act, app)
WHERE NOT EXISTS (SELECT 1 FROM cfg.ActivityApprovals x WHERE x.ActivityApproval_UID = v.id);
SET IDENTITY_INSERT cfg.ActivityApprovals OFF;

/* ---------------------------------------------------------------------------
   12) LegalFormDefinitions  (LegalForm + ShareholderNationality + share rules)
   --------------------------------------------------------------------------- */
SET IDENTITY_INSERT cfg.LegalFormDefinitions ON;
INSERT INTO cfg.LegalFormDefinitions
      (LegalFormDefinition_UID, ExtraProperties, ConcurrencyStamp, CreationTime, IsDeleted,
       LegalFormUid, ShareholderNationalityUid, ShareLimitPercent, MaxShareholderCount, RequiresServiceAgent)
SELECT v.id, @ex, CONVERT(nvarchar(40), NEWID()), @now, 0, v.lf, v.nat, v.pct, v.maxsh, v.agent
FROM (VALUES
      ( 1,  5, 1, CONVERT(decimal(18,2), 100.00),  50, 0),  -- LLC                | UAE          | 100%
      ( 2,  5, 2, CONVERT(decimal(18,2),  49.00),  50, 1),  -- LLC                | Egypt        | 49%, service agent
      ( 3,  7, 1, CONVERT(decimal(18,2), 100.00), 200, 0),  -- Public JSC         | UAE          | 100%
      ( 4, 11, 1, CONVERT(decimal(18,2), 100.00),   1, 0),  -- Sole Establishment | UAE          | single owner
      ( 5,  8, 2, CONVERT(decimal(18,2), 100.00),   1, 1),  -- Branch of Foreign Company | Egypt | service agent
      ( 6,  5, 3, CONVERT(decimal(18,2), 100.00),  50, 0),  -- LLC                | Saudi Arabia | GCC 100%
      ( 7,  5, 6, CONVERT(decimal(18,2),  49.00),  50, 1),  -- LLC                | India        | 49%, service agent
      ( 8,  6, 1, CONVERT(decimal(18,2), 100.00), 100, 0),  -- Private JSC        | UAE          | 100%
      ( 9, 12, 1, CONVERT(decimal(18,2), 100.00),   1, 0),  -- One Person Company | UAE          | single owner
      (10,  9, 4, CONVERT(decimal(18,2), 100.00),   1, 0)   -- Branch of Gulf Company | Kuwait   | GCC
     ) AS v(id, lf, nat, pct, maxsh, agent)
WHERE NOT EXISTS (SELECT 1 FROM cfg.LegalFormDefinitions x WHERE x.LegalFormDefinition_UID = v.id);
SET IDENTITY_INSERT cfg.LegalFormDefinitions OFF;

/* ---------------------------------------------------------------------------
   13) RestrictedActivityPerNationality  (Activity restricted for a Nationality)
   --------------------------------------------------------------------------- */
SET IDENTITY_INSERT cfg.RestrictedActivityPerNationalities ON;
INSERT INTO cfg.RestrictedActivityPerNationalities
      (RestrictedActivityPerNationality_UID, ExtraProperties, ConcurrencyStamp, CreationTime, IsDeleted,
       ActivityUid, NationalityUid, VersionNumber)
SELECT v.id, @ex, CONVERT(nvarchar(40), NEWID()), @now, 0, v.act, v.nat, v.ver
FROM (VALUES
      (1,  3, 2, 1),  -- Trading in building materials restricted for Egypt
      (2,  4, 2, 1),  -- IT services restricted for Egypt
      (3, 14, 2, 1),  -- Weapons trade restricted for Egypt
      (4, 14, 6, 1),  -- Weapons trade restricted for India
      (5, 14, 9, 1),  -- Weapons trade restricted for United States
      (6, 12, 7, 1)   -- Medical clinic management restricted for Pakistan
     ) AS v(id, act, nat, ver)
WHERE NOT EXISTS (SELECT 1 FROM cfg.RestrictedActivityPerNationalities x WHERE x.RestrictedActivityPerNationality_UID = v.id);
SET IDENTITY_INSERT cfg.RestrictedActivityPerNationalities OFF;

COMMIT TRANSACTION;
PRINT 'cfg lookup + rule seed completed.';

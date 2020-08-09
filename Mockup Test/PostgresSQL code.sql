-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "TB_Employee" (
    "Employment_Type" varchar NULL,
    "Region_Type" varchar    NOT NULL,
    "Primary_Team" varchar   NOT NULL,
    "EmpID" int   NOT NULL,
    CONSTRAINT "pk_TB_Employee" PRIMARY KEY (
        "EmpID"
     )
);

CREATE TABLE "TB_Hours" (
    "psa_Hours" int   NULL,
    "psa_hoursId" varchar   NOT NULL,
    "psa_Start" date   NULL,
    "Selling_rate" int   NULL,
    "projectid" varchar   NULL,
    "EmpID" int   NOT NULL,
    "psa_SellingAmount" int   NULL,
    CONSTRAINT "pk_TB_Hours" PRIMARY KEY (
        "psa_hoursId"
     )
);

CREATE TABLE "TB_Project" (
    "new_lossleader" boolean   NULL,
    "new_verbalagreement" boolean   NULL,
    "psa_enddate" date   NULL,
    "psa_program" varchar   NULL,
    "psa_projectid" varchar   NOT NULL,
    "psa_signed" boolean   NULL,
    "psa_startdate" date   NULL,
    "statuscode_display" varchar   NULL,
    "serviceline" varchar   NULL,
    "Team" varchar   NULL,
    "projectmanager_empID" int   NULL,
    "Overbudget_yes" boolean   NULL,
    "Budget" int   NULL,
    "projectstatus" varchar   NULL,
    CONSTRAINT "pk_TB_Project" PRIMARY KEY (
        "psa_projectid"
     )
);

CREATE TABLE "TB_Building" (
    "new_annualcostsavings" int   NULL,
    "new_annualemissionspreventedmtco2e" int   NULL,
    "new_annualenergysavingsmmbtu" int   NULL,
    "new_buildingtypenew_display" varchar   NULL,
    "new_country" varchar   NULL,
    "new_gallonswatersaved" int   NULL,
    "new_nda" boolean   NULL,
    "new_programenergysavings" int   NULL,
    "new_programfloors" int   NULL,
    "new_programsquarefootage" int   NULL,
    "new_programunits" int  NULL,
    "new_programwastediverted" int   NULL,
    "new_programwatersavings" int   NULL,
    "new_rdtaxcredit" boolean   NULL,
    "new_renewableenergykwh" int   NULL,
    "new_siteacreage" int   NULL,
    "new_tonswastediverted" int   NULL,
    "psa_programid" varchar   NOT NULL,
    "region" varchar   NULL,
    "CityID" int   NULL,
    "StateID" int   NULL,
    CONSTRAINT "pk_TB_Building" PRIMARY KEY (
        "psa_programid"
     )
);

ALTER TABLE "TB_Hours" ADD CONSTRAINT "fk_TB_Hours_projectid" FOREIGN KEY("projectid")
REFERENCES "TB_Project" ("psa_projectid");

ALTER TABLE "TB_Hours" ADD CONSTRAINT "fk_TB_Hours_EmpID" FOREIGN KEY("EmpID")
REFERENCES "TB_Employee" ("EmpID");

ALTER TABLE "TB_Project" ADD CONSTRAINT "fk_TB_Project_psa_projectid" FOREIGN KEY("psa_projectid")
REFERENCES "TB_Building" ("psa_programid");


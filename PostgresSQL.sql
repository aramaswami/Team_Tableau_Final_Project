-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "TB_Employee" (
    "Employment_Type" varchar   NOT NULL,
    "Region_Type" varchar   NOT NULL,
    "Primary_Team" varchar   NOT NULL,
    "EmpID" int   NOT NULL,
    CONSTRAINT "pk_TB_Employee" PRIMARY KEY (
        "EmpID"
     )
);

CREATE TABLE "TB_Hours" (
    "psa_Hours" int   NOT NULL,
    "psa_hoursId" varchar   NOT NULL,
    "psa_Start" date   NOT NULL,
    "Selling_rate" int   NOT NULL,
    "projectid" varchar   NOT NULL,
    "EmpID" int   NOT NULL,
    "psa_SellingAmount" int   NOT NULL,
    CONSTRAINT "pk_TB_Hours" PRIMARY KEY (
        "psa_hoursId"
     )
);

CREATE TABLE "TB_Project" (
    "new_lossleader" boolean   NOT NULL,
    "new_verbalagreement" boolean   NOT NULL,
    "psa_enddate" date   NOT NULL,
    "psa_program" varchar   NOT NULL,
    "psa_projectid" varchar   NOT NULL,
    "psa_signed" boolean   NOT NULL,
    "psa_startdate" date   NOT NULL,
    "statuscode_display" varchar   NOT NULL,
    "serviceline" varchar   NOT NULL,
    "Team" varchar   NOT NULL,
    "projectmanager_empID" int   NOT NULL,
    "Overbudget_yes" boolean   NOT NULL,
    "Budget" int   NOT NULL,
    "projectstatus" varchar   NOT NULL,
    CONSTRAINT "pk_TB_Project" PRIMARY KEY (
        "psa_projectid"
     )
);

CREATE TABLE "TB_Building" (
    "new_annualcostsavings" int   NOT NULL,
    "new_annualemissionspreventedmtco2e" int   NOT NULL,
    "new_annualenergysavingsmmbtu" int   NOT NULL,
    "new_buildingtypenew_display" varchar   NOT NULL,
    "new_country" varchar   NOT NULL,
    "new_gallonswatersaved" int   NOT NULL,
    "new_nda" boolean   NOT NULL,
    "new_programenergysavings" int   NOT NULL,
    "new_programfloors" int   NOT NULL,
    "new_programsquarefootage" int   NOT NULL,
    "new_programunits" int   NOT NULL,
    "new_programwastediverted" int   NOT NULL,
    "new_programwatersavings" int   NOT NULL,
    "new_rdtaxcredit" boolean   NOT NULL,
    "new_renewableenergykwh" int   NOT NULL,
    "new_siteacreage" int   NOT NULL,
    "new_tonswastediverted" int   NOT NULL,
    "psa_programid" varchar   NOT NULL,
    "region" varchar   NOT NULL,
    "CityID" int   NOT NULL,
    "StateID" int   NOT NULL,
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


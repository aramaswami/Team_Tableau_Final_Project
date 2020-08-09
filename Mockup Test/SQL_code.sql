CREATE TABLE "TB_Employee" (
    "region_type" varchar    NOT NULL,
    "EmpID" int   NOT NULL,
    CONSTRAINT "pk_TB_Employee" PRIMARY KEY (
        "EmpID"
     )
);

CREATE TABLE "TB_Hours" (
    "Hours_Amt" int   NULL,
    "HourID" varchar   NOT NULL,
    "Date" date   NULL,
    "ProjectID" varchar   NULL,
    "EmpID" int   NOT NULL,
    CONSTRAINT "pk_TB_Hours" PRIMARY KEY (
        "HourID"
     )
);

CREATE TABLE "TB_Project" (
    "End_Date" date 	NULL,
    "BuildingID" varchar   NULL,
    "ProjectID" varchar   NOT NULL,
    "Service_Line" varchar   NULL,
    "Team" varchar   NULL,
    "Project_Manager" int   NULL,
    "Overbudget_yes" boolean   NULL,
    "Budget" int   NULL,
    CONSTRAINT "pk_TB_Project" PRIMARY KEY (
        "ProjectID"
     )
);

CREATE TABLE "TB_Building" (
    "NDA" boolean   NULL,    
    "BuildingID" varchar   NOT NULL,
    "Region" varchar   NULL,
    CONSTRAINT "pk_TB_Building" PRIMARY KEY (
        "BuildingID"
     )
);

ALTER TABLE "TB_Hours" ADD CONSTRAINT "fk_TB_Hours_projectid" FOREIGN KEY("ProjectID")
REFERENCES "TB_Project" ("ProjectID");

ALTER TABLE "TB_Hours" ADD CONSTRAINT "fk_TB_Hours_EmpID" FOREIGN KEY("EmpID")
REFERENCES "TB_Employee" ("EmpID");

ALTER TABLE "TB_Project" ADD CONSTRAINT "fk_TB_Project_psa_projectid" FOREIGN KEY("BuildingID")
REFERENCES "TB_Building" ("BuildingID");


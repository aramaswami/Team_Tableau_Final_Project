-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "tb_hours" (
    "hours_amt" int   NOT NULL,
    "hour_id" varchar   NOT NULL,
    "date" date   NOT NULL,
    "project_id" varchar   NOT NULL,
    "emp_id" int   NOT NULL,
    CONSTRAINT "pk_tb_hours" PRIMARY KEY (
        "hour_id"
     )
);

CREATE TABLE "tb_employee" (
    "emp_id" int   NOT NULL,
    "region_type" varchar   NOT NULL,
    CONSTRAINT "pk_tb_employee" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "tb_building" (
    "nda" varchar   NOT NULL,
    "building_id" varchar   NOT NULL,
    "region" varchar   NOT NULL,
    CONSTRAINT "pk_tb_building" PRIMARY KEY (
        "building_id"
     )
);

CREATE TABLE "tb_project" (
    "end_date" date   NOT NULL,
    "building_id" varchar   NOT NULL,
    "project_id" varchar   NOT NULL,
    "service_line" varchar   NOT NULL,
    "team" varchar   NOT NULL,
    "project_manager" int   NOT NULL,
    "overbudget_yes" boolean   NOT NULL,
    "budget" int   NOT NULL,
    CONSTRAINT "pk_tb_project" PRIMARY KEY (
        "project_id"
     )
);

ALTER TABLE "tb_hours" ADD CONSTRAINT "fk_tb_hours_project_id" FOREIGN KEY("project_id")
REFERENCES "tb_project" ("project_id");

ALTER TABLE "tb_hours" ADD CONSTRAINT "fk_tb_hours_emp_id" FOREIGN KEY("emp_id")
REFERENCES "tb_employee" ("emp_id");

ALTER TABLE "tb_project" ADD CONSTRAINT "fk_tb_project_building_id" FOREIGN KEY("building_id")
REFERENCES "tb_building" ("building_id");


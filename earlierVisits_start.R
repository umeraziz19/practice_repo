library(tidyverse)
library(dplyr)
library(readxl)
library(lubridate)


rm(list = ls())

setwd("D:/System Analysis And Design/Data Science Class Augie Materials/R Excercise")

df_billing <- read_excel("Access Data to R/Billing.xlsx", sheet = 1)
df_Patient <- read_excel("Access Data to R/Patient.xlsx", sheet = 1)
df_Visit <- read_excel("Access Data to R/Visit.xlsx", sheet = 1) 
df_Visit$VisitDate <- ymd(df_Visit$VisitDate)

date <- as.Date("2021/01/01")

df_patient_1 <- df_Patient %>%
  dplyr::select("LastName", "FirstName", "Phone", "Address", "City", "Email", "PatientID") %>%
  distinct()


EarlierVisits <- df_Visit %>%
  dplyr::select("VisitID", "PatientID", "Reason", "VisitDate") %>%
  left_join(df_patient_1, by = c("PatientID")) %>%
  dplyr::filter(VisitDate < date)

allVisits <- df_Visit %>%
  dplyr::select("VisitID", "PatientID", "Reason", "VisitDate") %>%
  left_join(df_patient_1, by = c("PatientID"))

patients_all_city <- allVisits %>%
  dplyr::group_by(City) %>%
  dplyr::summarise(number = n())


# Name: Chinh Nguyen

#put my initials






CREATE SCHEMA stageProjectIDH;


CREATE TABLE [stageProjectIDH].[Taxi](
	[ID_TaxiT] [BIGINT] PRIMARY KEY,
    [HashIDTaxi] [varchar] NOT NULL 
);

CREATE TABLE [stageProjectIDH].[Company] (
    [ID_CompanyT] [INT] PRIMARY KEY,
    [Title] [NVARCHAR](255)
);

CREATE TABLE [stageProjectIDH].[CensusTract] (
    [ID_CensusTractT] [BIGINT] PRIMARY KEY,
    [IdentifierCensusTract] [BIGINT] NULL,
    [Latitude] [DECIMAL](9, 6) NULL,
    [Longitude] [DECIMAL](9, 6) NULL
);

CREATE TABLE [stageProjectIDH].[CommunityArea] (
    [ID_CommunityAreaT] [INT] PRIMARY KEY,
    [IdentifierArea] [INT] NULL
);

CREATE TABLE [stageProjectIDH].[PaymentType] (
    [ID_PaymentTypeT] [INT] PRIMARY KEY,
    [Title] [NVARCHAR](255)
);

CREATE TABLE [stageProjectIDH].[TimestampT] (
    [ID_TimestampT] [INT] PRIMARY KEY,
    [Year] [INT] NULL,
    [Month] [INT] NULL,
    [Day] [INT] NULL,
    [Hour] [INT] NULL,
    [Minute] [INT] NULL,
    [Second] [INT] NULL
);

CREATE TABLE [stageProjectIDH].[Trip] (
    [ID_Trip] [BIGINT] PRIMARY KEY,
    [IdentifierTrip] [varchar] NOT NULL, 
	[ID_Taxi] [BIGINT] FOREIGN KEY REFERENCES [stageProjectIDH].Taxi(ID_TaxiT),
    [StartTimestampID] [INT] FOREIGN KEY REFERENCES [stageProjectIDH].TimestampT(ID_TimestampT),
    [EndTimestampID] [INT] NULL FOREIGN KEY REFERENCES [stageProjectIDH].TimestampT(ID_TimestampT),
    [ID_PaymentType] [INT] FOREIGN KEY REFERENCES [stageProjectIDH].PaymentType(ID_PaymentTypeT),
    [ID_Company] [INT] FOREIGN KEY REFERENCES [stageProjectIDH].Company(ID_CompanyT),
    [PickupCensusTractID] [BIGINT] NULL FOREIGN KEY REFERENCES [stageProjectIDH].CensusTract(ID_CensusTractT),
    [DropoffCensusTractID] [BIGINT] NULL FOREIGN KEY REFERENCES [stageProjectIDH].CensusTract(ID_CensusTractT),
    [PickupCommunityAreaID] [INT] NULL FOREIGN KEY REFERENCES [stageProjectIDH].CommunityArea(ID_CommunityAreaT),
    [DropoffCommunityAreaID] [INT] NULL FOREIGN KEY REFERENCES [stageProjectIDH].CommunityArea(ID_CommunityAreaT),
    [Seconds] [INT] NULL,
    [Miles] [DECIMAL](10, 2) NULL,
    [Fares] [DECIMAL](10, 2) NULL,
    [Tips] [DECIMAL](10, 2) NULL,
    [Tolls] [DECIMAL](10, 2) NULL,
    [Extras] [DECIMAL](10, 2) NULL,
    [Total] [DECIMAL](10, 2) NULL
);

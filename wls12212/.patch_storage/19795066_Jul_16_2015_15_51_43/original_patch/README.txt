===============================
Diagnostic Patch for Bug: 19795066
===============================

Date: Jul 15, 2015
---------------------------------
Platform Patch for   : Generic
Product Patched      : JDBC
Product Version      : 12.2.1.0.0

This document describes how to install the interim patch for
bug # 16805016. It includes the following sections:

        Section 1, "Prerequisites"

        Section 2, "Pre-Installation Instructions"

        Section 3, "Installation Instructions"

        Section 4, "Post-Installation Instructions"

        Section 5, "Deinstallation Instructions"

        Section 6, "Post Deinstallation Instructions"

        Section 7, "Bugs Fixed by This Patch"


1 Prerequisites
----------------

Ensure that you meet the following requirements before you install or
deinstall the patch:

1. Before applying the non-mandatory patches, ensure that you have the
   exact symptoms described in the bug.

2. Oracle recommends that all customers be on the latest version of OPatch for
   their release. Download the latest version of OPatch 13.1.x via My Oracle
   Support Patch 6880880. (Choose 13.1.0.0.0 or "OUI NextGen 13.1")

   p6880880_131000_Generic.zip

   Review the following for more information:
   Doc ID 1587524.1, "Using OPatch 13.1 for Oracle Fusion Middleware 12c (12.1.2+)"
   https://support.oracle.com/rs?type=doc&id=1587524.1

   For Oracle Fusion Middleware OPatch usage, refer to the URL below which
   redirects to the latest FMW 12c document:
   "Oracle Fusion Middleware Patching With OPatch"
   http://www.oracle.com/pls/topic/lookup?ctx=fmw121x00&id=OPATC

3. Verify the OUI Inventory.
   OPatch needs access to a valid OUI inventory to apply patches.

   Note: This needs the ORACLE_HOME to be set(refer section "2. Pre-Installation Instructions")
   prior to run the below commands:

   Validate the OUI inventory with the following commands:

   $ opatch lsinventory

   If the command errors out, contact Oracle Support and work to validate
   and verify the inventory setup before proceeding.

4. Confirm the executables appear in your system PATH.

   The patching process will use the unzip and the OPatch executables. After
   setting the ORACLE_HOME environment, confirm if the following executables
   exist, before proceeding to the next step:

        - which opatch
        - which unzip

   If either of these executables do not show in the PATH, correct the
   problem before proceeding.

5. Create a location for storing the unzipped patch. This location
   will be referred to later in the document as PATCH_TOP.

   NOTE: On WINDOWS, the prefrred location is the drive root directory.
   For example, "C:\PATCH_TOP" and avoid choosing locations like,
   "C:\Documents and Settings\username\PATCH_TOP".
   This is necessary due to the 256 characters limitation on windows
   platform.


2 Pre-Installation Instructions
-------------------------------

a. Set the environment variable ORACLE_HOME to your product installed directory.

   for example: export ORACLE_HOME=/tmp/1221mwhome

b. Stop all servers (Admin Server and all Managed Server(s))


3 Installation Instructions
---------------------------

1. Unzip the patch zip file into the PATCH_TOP.

   $ unzip -d PATCH_TOP p19795066_122100_Generic.zip

  NOTE: In WINDOWS, the unzip command might not work as this zip has
  certain contents which passes the 256 characters limit.
  To overcome this problem, please use alternate ZIP utility like
  7-Zip to unzip the patch.

  For example: To unzip using 7-zip, run the command:
       "c:\Program Files\7-Zip\7z.exe" x p19795066_122100_Generic.zip

2. Set your current directory to the directory where the patch is located.

   $ cd PATCH_TOP/19795066

3. Run OPatch to apply the patch.

   $ opatch apply

When OPatch starts, it validates the patch and makes sure that there are no
conflicts with the software already installed in the ORACLE_HOME.
  OPatch categorizes two types of conflicts:

     a. Conflicts with a patch already applied to the ORACLE_HOME
        In this case, stop the patch installation, and contact Oracle Support
        Services.

     b. Conflicts with subset patch already applied to the ORACLE_HOME
        In this case, continue the install, as the new patch contains all the
        fixes from the existing patch in the ORACLE_HOME.



4 Post-Installation Instructions
---------------------------------

- Start all servers (Admin Server and all Managed Server(s))


5 Deinstallation Instructions
------------------------------

If you experience any problems after installing this patch, remove the patch as
follows:

1. Make sure to follow the same Prerequisites or pre-install steps (if any)
   when deinstalling a patch.
   This includes setting up any environment variables like ORACLE_HOME and
   verifying the OUI inventory before deinstalling.

2. Change to the directory where the patch was unzipped.

   $ cd PATCH_TOP/19795066

3. Run OPatch to deinstall the patch.

   $ opatch rollback -id 19795066


6 Post Deinstallation Instructions
-----------------------------------

Restart all servers (Admin Server and all Managed Server(s))


7 Bugs Fixed by This Patch
--------------------------
19795066 - ORA-904 CALLLING ORACLEDATABASEMETADATA.GETCOLUMNS AGAINST OLD DB

-----------------------------------------------------------------------------
DISCLAIMER:

This interim patch has only undergone basic unit testing, and has not been
through a complete test cycle generally followed for a production patch set.
Though the fixes in this document rectifies the bug, Oracle Corporation will
not be responsible for other issues that may arise due to these fixes.
Oracle Corporation recommends to later upgrade to the next production patch
set, when available. Applying this patch could overwrite other interim
patches applied since the last patch set. Customers need to make a request
to Oracle Support for a patch that includes those fixes, as well as inform
Oracle Support about all the patches installed when a Service Request is
opened. Please download, test, and provide feedback as soon as possible
to assist in the timely resolution of this problem.

Copyright (c) 2014, Oracle and/or its affiliates. All rights reserved.
-----------------------------------------------------------------------------


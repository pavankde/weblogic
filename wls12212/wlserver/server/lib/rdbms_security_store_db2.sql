CREATE TABLE BEACSS_SCHEMA_VERSION (CURRENT_VERSION INTEGER NOT NULL, PRIMARY KEY (CURRENT_VERSION));
CREATE TABLE BEAPC (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, CREDN VARCHAR(400) NOT NULL, CTS TIMESTAMP, PP BLOB, MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, CREDN));
CREATE TABLE BEAPCM (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, CN VARCHAR(400) NOT NULL, CTS TIMESTAMP, AN VARCHAR(256), MN VARCHAR(256), RN VARCHAR(256), WCN VARCHAR(256), WCI VARCHAR(256), PN VARCHAR(256), PP VARCHAR(256), MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, CN));
CREATE TABLE BEAPRMP (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, TYPEN VARCHAR(30) NOT NULL, CN VARCHAR(400) NOT NULL, CTS TIMESTAMP, CA VARCHAR(256), KAN VARCHAR(256), KAP VARCHAR(256), PN VARCHAR(256), PNIU VARCHAR(256), RN VARCHAR(256), WCN VARCHAR(256), WCI VARCHAR(256), MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, TYPEN, CN));
CREATE TABLE BEARM (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, CN VARCHAR(400) NOT NULL, CTS TIMESTAMP, AN VARCHAR(256), MN VARCHAR(256), PN VARCHAR(256), RN VARCHAR(256), WCN VARCHAR(256), WCI VARCHAR(256), MTS TIMESTAMP, PM_CN VARCHAR(400), PRIMARY KEY (DOMN, REALMN, CN));
CREATE TABLE BEASAML2_CACHE (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, CACHE_NAME VARCHAR(100) NOT NULL, ENTRY_KEY VARCHAR(400) NOT NULL, CTS TIMESTAMP, EXP_TIME BIGINT, ENTRY_VALUE BLOB, MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, CACHE_NAME, ENTRY_KEY));
CREATE TABLE BEASAML2_ENDPOINT (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, BINDING_LOCAL VARCHAR(384) NOT NULL, BINDING_TYPE VARCHAR(32) NOT NULL, PARTNER_NAME VARCHAR(128) NOT NULL, SERVICE_TYPE VARCHAR(32) NOT NULL, CTS TIMESTAMP, DFT_ENDPOINT SMALLINT, DFT_SET SMALLINT, IDX INTEGER, MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, BINDING_LOCAL, BINDING_TYPE, PARTNER_NAME, SERVICE_TYPE));
CREATE TABLE BEASAML2_IDPPARTNER (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, NAME VARCHAR(128) NOT NULL, CTS TIMESTAMP, ARTPOSTFORM VARCHAR(256), ARTUSEPOST SMALLINT, C_PASSSWD VARCHAR(256), C_PASSWDSET SMALLINT, C_USERNAME VARCHAR(128), CONFM_METHOD VARCHAR(128), CP_COMPANY VARCHAR(64), CP_EMAILADD VARCHAR(64), CP_GIVENNAME VARCHAR(64), CP_SURNAME VARCHAR(64), CP_TELENUM VARCHAR(64), CP_TYPE VARCHAR(64), DESCRIPTION VARCHAR(512), ENABLED SMALLINT, ENTITYID VARCHAR(512), ERROR_URL VARCHAR(512), ISSUER_URI VARCHAR(512), OG_NAME VARCHAR(64), OG_URL VARCHAR(512), PT_TYPE VARCHAR(64), POSTPOSTFORM VARCHAR(256), SIGNINGCERT BLOB, TPLAYER_CLIENTCERT BLOB, ARTREQSIGNED SMALLINT, IDP_NM_CLASSN VARCHAR(128), PROC_ATTR SMALLINT, VIRUSER_ENABLED SMALLINT, WANT_ASSERTION_SIGNED SMALLINT, WANTATNREQSIGNED SMALLINT, MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, NAME));
CREATE TABLE BEASAML2_IDP_AUDIENCEURI (DOMN VARCHAR(128), REALMN VARCHAR(128), PARTNER_NAME VARCHAR(128), URI VARCHAR(512));
CREATE TABLE BEASAML2_IDP_PT_EP (DOMN VARCHAR(254), REALMN VARCHAR(254), NAME VARCHAR(254), SERVICE_TYPE VARCHAR(128), BINDING_TYPE VARCHAR(128), BINDING_LOCAL VARCHAR(512));
CREATE TABLE BEASAML2_IDP_REDIRECTURI (DOMN VARCHAR(128), REALMN VARCHAR(128), PARTNER_NAME VARCHAR(128), URI VARCHAR(512));
CREATE TABLE BEASAML2_SPPARTNER (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, NAME VARCHAR(128) NOT NULL, CTS TIMESTAMP, ARTPOSTFORM VARCHAR(256), ARTUSEPOST SMALLINT, C_PASSSWD VARCHAR(256), C_PASSWDSET SMALLINT, C_USERNAME VARCHAR(128), CONFM_METHOD VARCHAR(128), CP_COMPANY VARCHAR(64), CP_EMAILADD VARCHAR(64), CP_GIVENNAME VARCHAR(64), CP_SURNAME VARCHAR(64), CP_TELENUM VARCHAR(64), CP_TYPE VARCHAR(64), DESCRIPTION VARCHAR(512), ENABLED SMALLINT, ENTITYID VARCHAR(512), ERROR_URL VARCHAR(512), ISSUER_URI VARCHAR(512), OG_NAME VARCHAR(64), OG_URL VARCHAR(512), PT_TYPE VARCHAR(64), POSTPOSTFORM VARCHAR(256), SIGNINGCERT BLOB, TPLAYER_CLIENTCERT BLOB, ARTREQSIGNED SMALLINT, GENATTRS SMALLINT, ONETIMEUSE SMALLINT, KEYINFO_INC SMALLINT, SP_NM_CLASSN VARCHAR(128), TIME_TOLIVE INTEGER, TIME_TOLIVEOFFSET INTEGER, WANT_ASSERTION_SIGNED SMALLINT, WANT_ANTREQSIGNED SMALLINT, MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, NAME));
CREATE TABLE BEASAML2_SP_AUDIENCEURI (DOMN VARCHAR(128), REALMN VARCHAR(128), PARTNER_NAME VARCHAR(128), URI VARCHAR(512));
CREATE TABLE BEASAML2_SP_PT_EP (DOMN VARCHAR(254), REALMN VARCHAR(254), NAME VARCHAR(254), SERVICE_TYPE VARCHAR(128), BINDING_TYPE VARCHAR(128), BINDING_LOCAL VARCHAR(512));
CREATE TABLE BEASAMLAP (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, REGN VARCHAR(128) NOT NULL, CN VARCHAR(400) NOT NULL, CTS TIMESTAMP, SPD VARCHAR(512), SPE VARCHAR(16), SARU VARCHAR(512), SASCA VARCHAR(128), SAP VARCHAR(128), SAU VARCHAR(128), SGAE VARCHAR(16), SITU VARCHAR(512), SIU VARCHAR(512), SNMC VARCHAR(128), SPARSCE VARCHAR(16), SP VARCHAR(32), SPSCA VARCHAR(128), SSA VARCHAR(16), SSI VARCHAR(512), STU VARCHAR(512), SVUE VARCHAR(16), MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, REGN, CN));
CREATE TABLE BEASAMLAP_AURI (DOMN VARCHAR(128), REALMN VARCHAR(128), REGN VARCHAR(128), CN VARCHAR(400), SAURI VARCHAR(512));
CREATE TABLE BEASAMLAP_ITP (DOMN VARCHAR(128), REALMN VARCHAR(128), REGN VARCHAR(128), CN VARCHAR(400), SITP VARCHAR(512));
CREATE TABLE BEASAMLAP_RURI (DOMN VARCHAR(128), REALMN VARCHAR(128), REGN VARCHAR(128), CN VARCHAR(400), SRURI VARCHAR(512));
CREATE TABLE BEASAMLRP (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, REGN VARCHAR(128) NOT NULL, CN VARCHAR(400) NOT NULL, CTS TIMESTAMP, SPD VARCHAR(512), SPE VARCHAR(16), SACU VARCHAR(512), SAP VARCHAR(128), SASCCA VARCHAR(128), SAU VARCHAR(128), SDNCC VARCHAR(16), SGAE VARCHAR(16), SKI VARCHAR(16), SNMC VARCHAR(128), SPF VARCHAR(128), SP VARCHAR(32), SSA VARCHAR(16), STU VARCHAR(512), STTL VARCHAR(32), STTLO VARCHAR(32), MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, REGN, CN));
CREATE TABLE BEASAMLRP_ACP (DOMN VARCHAR(128), REALMN VARCHAR(128), REGN VARCHAR(128), CN VARCHAR(400), SACP VARCHAR(512));
CREATE TABLE BEASAMLRP_AU (DOMN VARCHAR(128), REALMN VARCHAR(128), REGN VARCHAR(128), CN VARCHAR(400), SAU VARCHAR(512));
CREATE TABLE BEAUPC (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, CREDN VARCHAR(128) NOT NULL, CTS TIMESTAMP, PN VARCHAR(128), PP BLOB, MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, CREDN));
CREATE TABLE BEAWCMCI (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, WCN VARCHAR(128) NOT NULL, CTS TIMESTAMP, WCT VARCHAR(128), WCV VARCHAR(128), WXF BLOB, MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, WCN));
CREATE TABLE BEAWCRE (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, REGN VARCHAR(128) NOT NULL, CN VARCHAR(400) NOT NULL, CTS TIMESTAMP, UC BLOB, WCRIDN VARCHAR(400), WCRSN VARCHAR(400), WCRSDN VARCHAR(400), WCRSKI VARCHAR(400), MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, REGN, CN));
CREATE TABLE BEAWPCI (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, WCN VARCHAR(128) NOT NULL, CTS TIMESTAMP, WCT VARCHAR(128), WCV VARCHAR(128), WXF BLOB, MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, WCN));
CREATE TABLE BEAWRCI (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, WCN VARCHAR(128) NOT NULL, CTS TIMESTAMP, WCT VARCHAR(128), WCV VARCHAR(128), WXF BLOB, MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, WCN));
CREATE TABLE BEAXACMLAP (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, TYPEN VARCHAR(32) NOT NULL, CN VARCHAR(400) NOT NULL, XVER VARCHAR(10) NOT NULL, CTS TIMESTAMP, WCN VARCHAR(128), WCI VARCHAR(128), WXF BLOB, XD BLOB, XS VARCHAR(10), MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, TYPEN, CN, XVER));
CREATE TABLE BEAXACMLAP_RS (DOMN VARCHAR(128), REALMN VARCHAR(128), TYPEN VARCHAR(32), CN VARCHAR(400), XVER VARCHAR(10), XRS VARCHAR(400));
CREATE TABLE BEAXACMLRAP (DOMN VARCHAR(128) NOT NULL, REALMN VARCHAR(128) NOT NULL, TYPEN VARCHAR(32) NOT NULL, CN VARCHAR(400) NOT NULL, XVER VARCHAR(10) NOT NULL, CTS TIMESTAMP, WCN VARCHAR(128), WCI VARCHAR(128), WXF BLOB, XD BLOB, XS VARCHAR(10), MTS TIMESTAMP, PRIMARY KEY (DOMN, REALMN, TYPEN, CN, XVER));
CREATE TABLE BEAXACMLRAP_R (DOMN VARCHAR(128), REALMN VARCHAR(128), TYPEN VARCHAR(400), CN VARCHAR(400), XVER VARCHAR(10), XR VARCHAR(400));
CREATE TABLE BEAXACMLRAP_RS (DOMN VARCHAR(128), REALMN VARCHAR(128), TYPEN VARCHAR(32), CN VARCHAR(400), XVER VARCHAR(10), XRS VARCHAR(400));
INSERT INTO BEACSS_SCHEMA_VERSION VALUES (2);
COMMIT;

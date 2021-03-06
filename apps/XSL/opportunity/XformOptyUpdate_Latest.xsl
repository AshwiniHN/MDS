<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="../OptyAssociationSiebelProvABCSImpl.wsdl"/>
      <rootElement name="EventsToProcess" namespace="http://www.siebel.com/xml/OptyEventsToProcessFromBroker"/>
    </source>
    <source type="WSDL">
      <schema location="../OptyAssociationSiebelProvABCSImpl.wsdl"/>
      <rootElement name="MultiIds" namespace="http://SalesforceIntegration/Opty_SFIds"/>
      <param name="VarIds" />
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="http://sfintegration-dev.corpzone.internalzone.com:80/soa-infra/services/default/OptyWSEndPointSiebelProcess/ISG_SF_Opportunity_WS.wsdl"/>
      <rootElement name="ListOfIsg_Sf_Opportunity_Io" namespace="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Data"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.8(build 150622.2350.0222) AT [FRI DEC 18 14:01:10 CST 2015]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xsdLocal1="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Data"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xsdLocal2="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Id"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:tns1="http://siebel.com/webservices"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:ns2="http://SalesforceIntegration/Opty_SFIds"
                xmlns:ns100="urn:enterprise.soap.sforce.com"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:tns="http://siebel.com/CustomUI"
                xmlns:xsdLocal3="http://www.siebel.com/xml/ISG_SF_Opportunity_IO/Query"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:client="http://xmlns.oracle.com/SFProject/OpportunityFromSFtoSiebel/OptyAssociationSiebelProvABCSImpl"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:ns10="http://www.siebel.com/xml/OptyEventsToProcessFromBroker"
                xmlns:ens="urn:sobject.enterprise.soap.sforce.com"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl ns2 ns100 wsdl plnk client xsd ns10 xsdLocal1 xsdLocal2 tns1 soapenc soap tns xsdLocal3 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
  <xsl:param name="VarIds"/>
  <xsl:template match="/">
    <xsdLocal1:ListOfIsg_Sf_Opportunity_Io>
      <xsl:apply-templates select="/ns10:EventsToProcess/ns10:ListOfEvent/ns10:Event[ns10:Operation !='Delete']"/>
    </xsdLocal1:ListOfIsg_Sf_Opportunity_Io>
  </xsl:template>
  <xsl:template match="/ns10:EventsToProcess/ns10:ListOfEvent/ns10:Event[ns10:Operation !='Delete']">
    <xsl:variable name="PartnerID" select="ns10:Document/ns100:result/ens:Id"/>
    <xsl:variable name="AccountId"
                  select="ns10:Document/ns100:result/ens:Partner_Account_ID__c"/>
    <xsl:variable name="Opportunity_Id"
                  select="ns10:Document/ns100:result/ens:Opportunity__c"/>
				  <xsl:variable name="Accid_partner"
                  select="substring-after($VarIds/ns2:MultiIds/ns2:ids[ns2:SFPartnerID=$PartnerID]/ns2:SBLPartnerID,'+')"/>
    <xsl:variable name="Accid_xref"
                  select="$VarIds/ns2:MultiIds/ns2:ids[ns2:SFAccountId=$AccountId]/ns2:SiebelAccId"/>
    <xsl:choose>
      <xsl:when test="(string-length($VarIds/ns2:MultiIds/ns2:ids[ns2:SFPartnerID=$PartnerID]/ns2:SBLPartnerID) != 0.0   and  string-length($VarIds/ns2:MultiIds/ns2:ids[ns2:SFAccountId=$AccountId]/ns2:SiebelAccId) != 0.0 
 and string-length($VarIds/ns2:MultiIds/ns2:ids[ns2:SFOptyId=$Opportunity_Id]/ns2:SiebelOptyId) != 0.0 and $Accid_partner=$Accid_xref )  ">
        <xsdLocal1:Opportunity>
          <xsdLocal1:Id>
            <xsl:value-of select="$VarIds/ns2:MultiIds/ns2:ids[ns2:SFOptyId=$Opportunity_Id]/ns2:SiebelOptyId"/>
          </xsdLocal1:Id>
          
          
          <!--xsl:if test="ns10:Document/ns100:result/ens:Approved_Product_Types__c">
            <xsdLocal1:MFEDealRegProductsStr>
              <xsl:value-of select="ns10:Document/ns100:result/ens:Approved_Product_Types__c"/>
            </xsdLocal1:MFEDealRegProductsStr>
          </xsl:if>
          <xsl:if test="ns10:Document/ns100:result/ens:Partner_Expiration_Date__c">
            <xsdLocal1:MFEDealRegExpirationDate>
              <xsl:call-template name="ConvertSFDateToSiebelDate">
                <xsl:with-param name="Date"
                                select="ns10:Document/ns100:result/ens:Partner_Expiration_Date__c"/>
              </xsl:call-template>
              <xsl:value-of select="ns10:Document/ns10:DocumentMessage/ns100:result/ens:Partner_Expiration_Date__c"/ >
            </xsdLocal1:MFEDealRegExpirationDate>
          </xsl:if>
          <   <xsl:if test="ns10:Document/ns100:result/ens:Approved_Product_Types__c">
            <xsdLocal1:ListOfMfeDealRegApprovedProducts>
              <xsdLocal1:MfeDealRegApprovedProducts>
                <xsdLocal1:MFEDealRegProducts>
                  <xsl:value-of select="ns10:Document/ns100:result/ens:Approved_Product_Types__c"/>
                </xsdLocal1:MFEDealRegProducts>
              </xsdLocal1:MfeDealRegApprovedProducts>
            </xsdLocal1:ListOfMfeDealRegApprovedProducts>
          </xsl:if> -->
          <xsdLocal1:ListOfOpportunity_Organization>
            <xsdLocal1:Opportunity_Organization>
              <xsl:if test="ns10:Document/ns100:result/ens:Primary__c">
                <xsl:choose>
                  <xsl:when test="ns10:Document/ns100:result/ens:Primary__c = 'true'">
                    <xsl:attribute name="IsPrimaryMVG">
                      <xsl:value-of select="'Y'"/>
                    </xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="IsPrimaryMVG">
                      <xsl:value-of select="'N'"/>
                    </xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
              <xsl:if test="$VarIds/ns2:MultiIds/ns2:ids[ns2:SFAccountId=$AccountId]/ns2:SiebelAccId">
                <xsdLocal1:Id>
                  <xsl:value-of select="$VarIds/ns2:MultiIds/ns2:ids[ns2:SFAccountId=$AccountId]/ns2:SiebelAccId"/>
                </xsdLocal1:Id>
              </xsl:if>
              <xsl:if test="ns10:Document/ns100:result/ens:Disti_Locked__c">
                <xsl:choose>
                  <xsl:when test="ns10:Document/ns100:result/ens:Disti_Locked__c = 'true'">
                    <xsdLocal1:ISGSFPartnerDistiLockedFlag>
                      <xsl:value-of select="'Y'"/>
                    </xsdLocal1:ISGSFPartnerDistiLockedFlag>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsdLocal1:ISGSFPartnerDistiLockedFlag>
                      <xsl:value-of select="'N'"/>
                    </xsdLocal1:ISGSFPartnerDistiLockedFlag>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
              
            <xsl:choose>
              <xsl:when test="ns10:Document/ns100:result/ens:Program_Benefit__c">
                <xsdLocal1:ISGSFPartnerPBR>
                  <xsl:value-of select="ns10:Document/ns100:result/ens:Program_Benefit__c"/>
                </xsdLocal1:ISGSFPartnerPBR>
              </xsl:when>
			   <xsl:otherwise>
                  <xsdLocal1:ISGSFPartnerPBR>
					<xsl:text disable-output-escaping="no"></xsl:text>
				  </xsdLocal1:ISGSFPartnerPBR>
                  </xsl:otherwise>
			  </xsl:choose>
              
               <xsl:if test="ns10:Document/ns100:result/ens:PBR_Active__c">
                <xsl:choose>
                  <xsl:when test="ns10:Document/ns100:result/ens:PBR_Active__c = 'true'">
                    <xsdLocal1:ISGSFPartnerPBRApprovedFlag>
                      <xsl:value-of select="'Y'"/>
                    </xsdLocal1:ISGSFPartnerPBRApprovedFlag>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsdLocal1:ISGSFPartnerPBRApprovedFlag>
                      <xsl:value-of select="'N'"/>
                    </xsdLocal1:ISGSFPartnerPBRApprovedFlag>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
              
               <xsl:if test="ns10:Document/ns100:result/ens:Partner_Expiration_Date__c">
            <xsdLocal1:ISGSFOptyDealExpDate>
              <xsl:call-template name="ConvertSFDateToSiebelDate">
                <xsl:with-param name="Date"
                                select="ns10:Document/ns100:result/ens:Partner_Expiration_Date__c"/>
              </xsl:call-template>
            
            </xsdLocal1:ISGSFOptyDealExpDate>
          </xsl:if>
              
                <xsl:if test="ns10:Document/ns100:result/ens:Approved_Product_Types__c">
            <xsdLocal1:ISGSFOptyDealApprProducts>
              <xsl:value-of select="ns10:Document/ns100:result/ens:Approved_Product_Types__c"/>
            </xsdLocal1:ISGSFOptyDealApprProducts>
          </xsl:if>
              
              
              
            </xsdLocal1:Opportunity_Organization>
          </xsdLocal1:ListOfOpportunity_Organization>
        </xsdLocal1:Opportunity>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="ConvertSFDateToSiebelDate">
    <xsl:param name="Date"/>
    
     <xsl:if test="string-length($Date) != 0">
      <xsl:variable name="Year" select="substring-before ($Date, '-')"/>
      <xsl:variable name="MonthTmp" select="substring-after($Date, '-')"/>
      <xsl:variable name="Month" select="substring-before ($MonthTmp, '-')"/>
      <xsl:variable name="Day" select="substring-after ($MonthTmp,'-')"/>
     
     <xsl:variable name="ModifiedDate"
                    select="concat ($Year , '/', $Month ,'/',$Day)"/>
      <xsl:value-of select="$ModifiedDate"/>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>

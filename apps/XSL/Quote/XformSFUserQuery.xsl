<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="../../../../../../../../SF%20Project/Post%20Go%20Live%20Issues/MDT/Release2/Evolve12/INSALES-4086/QuoteIntegrationFromBrokerToSF/QuoteToOptySync.wsdl"/>
      <rootElement name="Modified_Quotes" namespace=""/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="oramds:/apps/SOA-INFRA/WSDL/SFEndpointProcess.wsdl"/>
      <rootElement name="process" namespace="http://SalesforceProject/SFEndpointProcess"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.8(build 150622.2350.0222) AT [TUE OCT 10 10:43:57 IST 2017]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:client="http://xmlns.oracle.com/QuoteIntegration/QuoteIntegrationFromBrokerToSF/QuoteToOptySync"
                xmlns:ns0="http://SalesforceProject/SFEndpointProcess"
                xmlns:ns3="http://SFEndpoint/url"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:ns2="urn:enterprise.soap.sforce.com"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl plnk client xsd wsdl ns0 ns3 ns2 bpws xp20 mhdr bpel oraext dvm hwf med ids bpm xdk xref ora socket ldap">
  <xsl:template match="/">
    <ns0:process>
      <xsl:variable name="var_createdByName"
                    select="/Modified_Quotes/Quote_Header/Created_By_Name"/>
                    <xsl:variable name="sq">'</xsl:variable>
      <ns0:Operation>
        <xsl:text disable-output-escaping="no">Query</xsl:text>
      </ns0:Operation>
      <ns0:CallerID>
        <xsl:text disable-output-escaping="no">QuoteSync</xsl:text>
      </ns0:CallerID>
      <ns0:queryString>
        <xsl:value-of select="concat('SELECT id,Legacy_User_Id__c FROM User WHERE Legacy_User_Id__c =',$sq,$var_createdByName,$sq)"/>
      </ns0:queryString>
    </ns0:process>
  </xsl:template>
</xsl:stylesheet>

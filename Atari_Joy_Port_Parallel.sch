<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.4.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="250" name="Descript" color="7" fill="1" visible="yes" active="yes"/>
<layer number="251" name="SMDround" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Wurth_Elektronik_Electromechanic_Input-Output_Connectors_rev19a" urn="urn:adsk.eagle:library:488835">
<description>&lt;BR&gt;Wurth Elektronik - Input/Output Connectors &lt;br&gt;&lt;Hr&gt;
&lt;BR&gt;&lt;BR&gt; 
&lt;TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0&gt;
&lt;TR&gt;   
&lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;&lt;BR&gt;&lt;br&gt;
      &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;BR&gt;
       &lt;BR&gt;
       &lt;BR&gt;
       &lt;BR&gt;&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
&lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;&lt;br&gt;
      -----&lt;BR&gt;
      -----&lt;BR&gt;
      -----&lt;BR&gt;
      -----&lt;BR&gt;
      -----&lt;BR&gt;&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt; &lt;FONT FACE=ARIAL SIZE=3&gt;&lt;br&gt;
      ---------------------------&lt;BR&gt;
&lt;B&gt;&lt;I&gt;&lt;span style='font-size:26pt;
  color:#FF6600;'&gt;WE &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;
&lt;BR&gt;
      ---------------------------&lt;BR&gt;&lt;b&gt;Würth Elektronik&lt;/b&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;&lt;br&gt;
      ---------O---&lt;BR&gt;
      ----O--------&lt;BR&gt;
      ---------O---&lt;BR&gt;
      ----O--------&lt;BR&gt;
      ---------O---&lt;BR&gt;&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
   
&lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;&lt;BR&gt;
      &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;BR&gt;
       &lt;BR&gt;
       &lt;BR&gt;
       &lt;BR&gt;
       &lt;BR&gt;&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;

  &lt;TR&gt;
    &lt;TD COLSPAN=7&gt;&amp;nbsp;
    &lt;/TD&gt;
  &lt;/TR&gt;
  
&lt;/TABLE&gt;
&lt;B&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;More than you expect&lt;BR&gt;&lt;BR&gt;&lt;BR&gt;&lt;/B&gt;

&lt;HR&gt;&lt;BR&gt;
&lt;b&gt;Würth Elektronik eiSos GmbH &amp; Co. KG&lt;/b&gt;&lt;br&gt;
EMC &amp; Inductive Solutions&lt;br&gt;

Max-Eyth-Str.1&lt;br&gt;
D-74638 Waldenburg&lt;br&gt;
&lt;br&gt;
Tel: +49 (0)7942-945-0&lt;br&gt;
Fax:+49 (0)7942-945-405&lt;br&gt;
&lt;br&gt;
&lt;a href="http://www.we-online.com/web/en/electronic_components/produkte_pb/bauteilebibliotheken/eagle_4.php"&gt;www.we-online.com/eagle&lt;/a&gt;&lt;br&gt;
&lt;a href="mailto:libraries@we-online.com"&gt;libraries@we-online.com&lt;/a&gt; &lt;BR&gt;&lt;BR&gt;
&lt;br&gt;&lt;HR&gt;&lt;BR&gt;
Neither Autodesk nor Würth Elektronik eiSos does warrant that this library is error-free or &lt;br&gt;
that it meets your specific requirements.&lt;br&gt;&lt;BR&gt;
Please contact us for more information.&lt;br&gt;&lt;BR&gt;&lt;br&gt;
&lt;hr&gt;
Eagle Version 6, Library Revision 2019a,2018-01-10&lt;br&gt;
&lt;HR&gt;
Copyright: Würth Elektronik</description>
<packages>
<package name="618009211821" urn="urn:adsk.eagle:footprint:3359803/3" library_version="4">
<description>WR-DSUB 8.08mm Female Angled PCB Connector without Hex Screw, 9 Pins</description>
<wire x1="-15.4" y1="3" x2="15.4" y2="3" width="0.127" layer="21"/>
<wire x1="15.4" y1="3" x2="15.4" y2="-9.42" width="0.127" layer="21"/>
<wire x1="-15.4" y1="-9.42" x2="-15.4" y2="3" width="0.127" layer="21"/>
<wire x1="15.4" y1="-9.5" x2="15.4" y2="-15.5" width="0.127" layer="51"/>
<wire x1="15.4" y1="-15.5" x2="-15.4" y2="-15.5" width="0.127" layer="51"/>
<wire x1="-15.4" y1="-15.5" x2="-15.4" y2="-9.5" width="0.127" layer="51"/>
<wire x1="15.4" y1="-9.42" x2="-15.4" y2="-9.42" width="0.127" layer="21"/>
<pad name="Z1" x="-12.5" y="0" drill="3.2"/>
<pad name="Z2" x="12.5" y="0" drill="3.2"/>
<pad name="3" x="0" y="1.42" drill="1"/>
<pad name="4" x="-2.77" y="1.42" drill="1"/>
<pad name="5" x="-5.54" y="1.42" drill="1"/>
<pad name="2" x="2.77" y="1.42" drill="1"/>
<pad name="1" x="5.54" y="1.42" drill="1"/>
<pad name="6" x="4.155" y="-1.42" drill="1"/>
<pad name="7" x="1.385" y="-1.42" drill="1"/>
<pad name="8" x="-1.385" y="-1.42" drill="1"/>
<pad name="9" x="-4.155" y="-1.42" drill="1"/>
<text x="17.355" y="-4.12" size="1.27" layer="25">&gt;NAME</text>
<text x="17.355" y="-6.96" size="1.27" layer="27">&gt;VALUE</text>
<text x="7.215" y="0.735" size="1.27" layer="51">1</text>
<text x="-6.8" y="-2.105" size="1.27" layer="51">9</text>
<text x="7.215" y="0.735" size="1.27" layer="21">1</text>
<text x="-3.3" y="-8.7" size="0.4064" layer="48">EDGE OF PCB Board</text>
<polygon width="0.127" layer="39">
<vertex x="-15.65" y="3.23"/>
<vertex x="15.65" y="3.23"/>
<vertex x="15.65" y="-9.5"/>
<vertex x="-15.65" y="-9.5"/>
</polygon>
</package>
</packages>
<packages3d>
<package3d name="618009211821" urn="urn:adsk.eagle:package:3360008/3" type="box" library_version="4">
<description>WR-DSUB 8.08mm Female Angled PCB Connector without Hex Screw, 9 Pins</description>
<packageinstances>
<packageinstance name="618009211821"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="R9" urn="urn:adsk.eagle:symbol:3359644/3" library_version="4">
<wire x1="-14.3" y1="5.08" x2="14.3" y2="5.08" width="0.4064" layer="94"/>
<wire x1="12.7" y1="-7.62" x2="-12.7" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="12.7018" y1="-7.624" x2="14.0694" y2="-6.5054" width="0.4064" layer="94" curve="77.657889"/>
<wire x1="16.0758" y1="2.9496" x2="14.0694" y2="-6.5054" width="0.4064" layer="94"/>
<wire x1="16.0669" y1="2.9006" x2="14.1242" y2="5.078" width="0.4064" layer="94" curve="102.337599" cap="flat"/>
<wire x1="-12.7018" y1="-7.624" x2="-14.0694" y2="-6.5054" width="0.4064" layer="94" curve="-77.657889"/>
<wire x1="-16.0758" y1="2.9496" x2="-14.0694" y2="-6.5054" width="0.4064" layer="94"/>
<wire x1="-16.0669" y1="2.9006" x2="-14.1242" y2="5.078" width="0.4064" layer="94" curve="-102.337599" cap="flat"/>
<wire x1="10.16" y1="2.54" x2="10.16" y2="5.08" width="0.1524" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="5.08" width="0.1524" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="5.08" width="0.1524" layer="94"/>
<wire x1="-5.08" y1="2.54" x2="-5.08" y2="5.08" width="0.1524" layer="94"/>
<wire x1="-10.16" y1="2.54" x2="-10.16" y2="5.08" width="0.1524" layer="94"/>
<wire x1="7.62" y1="-7.66" x2="7.62" y2="-3.31" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-7.66" x2="2.54" y2="-3.31" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-7.66" x2="-2.54" y2="-3.31" width="0.1524" layer="94"/>
<wire x1="-7.62" y1="-7.66" x2="-7.62" y2="-3.31" width="0.1524" layer="94"/>
<text x="17.78" y="0" size="1.778" layer="95">&gt;NAME</text>
<text x="17.78" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="10.16" y="10.16" visible="pad" length="middle" rot="R270"/>
<pin name="2" x="5.08" y="10.16" visible="pad" length="middle" rot="R270"/>
<pin name="3" x="0" y="10.16" visible="pad" length="middle" rot="R270"/>
<pin name="4" x="-5.08" y="10.16" visible="pad" length="middle" rot="R270"/>
<pin name="5" x="-10.16" y="10.16" visible="pad" length="middle" rot="R270"/>
<pin name="6" x="7.62" y="-12.7" visible="pad" length="middle" rot="R90"/>
<pin name="7" x="2.54" y="-12.7" visible="pad" length="middle" rot="R90"/>
<pin name="8" x="-2.54" y="-12.7" visible="pad" length="middle" rot="R90"/>
<pin name="9" x="-7.62" y="-12.7" visible="pad" length="middle" rot="R90"/>
<pin name="SHIELD" x="-20.32" y="0" visible="pad" length="middle"/>
<circle x="10.16" y="1.778" radius="0.762" width="0.254" layer="94"/>
<circle x="5.08" y="1.778" radius="0.762" width="0.254" layer="94"/>
<circle x="0" y="1.778" radius="0.762" width="0.254" layer="94"/>
<circle x="-5.08" y="1.778" radius="0.762" width="0.254" layer="94"/>
<circle x="-10.16" y="1.778" radius="0.762" width="0.254" layer="94"/>
<circle x="7.62" y="-2.54" radius="0.762" width="0.254" layer="94"/>
<circle x="2.54" y="-2.54" radius="0.762" width="0.254" layer="94"/>
<circle x="-2.54" y="-2.54" radius="0.762" width="0.254" layer="94"/>
<circle x="-7.62" y="-2.54" radius="0.762" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="618009211821" urn="urn:adsk.eagle:component:3360217/3" prefix="J" uservalue="yes" library_version="4">
<description>&lt;b&gt;WR-DSUB 8.08mm Female Angled PCB Connector without Hex Screw, 9 Pins&lt;/b&gt;=&gt;Code : Con_I-O_DSUB_PCB_Female_wo-screw_6180xx211821
&lt;br&gt;&lt;a href="http://katalog.we-online.de/media/images/eican/Con_I-O_DSUB_PCB_Female_wo-screw_6180xx211821_pf2.jpg" title="Enlarge picture"&gt;
&lt;img src="http://katalog.we-online.de/media/thumbs2/eican/thb_Con_I-O_DSUB_PCB_Female_wo-screw_6180xx211821_pf2.jpg" width="320"&gt;&lt;/a&gt;&lt;p&gt;
Details see: &lt;a href="http://katalog.we-online.de/en/em/DSUB_FEMALE_ANGLED_PCB_CONNECTOR_W_O_HEX_SCREW_8_08MM_6180XX211821"&gt;http://katalog.we-online.de/en/em/DSUB_FEMALE_ANGLED_PCB_CONNECTOR_W_O_HEX_SCREW_8_08MM_6180XX211821&lt;/a&gt;&lt;p&gt;
Created 2014-07-10, Karrer Zheng&lt;br&gt;
2014 (C) Würth Elektronik</description>
<gates>
<gate name="G$1" symbol="R9" x="0" y="0"/>
</gates>
<devices>
<device name="" package="618009211821">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
<connect gate="G$1" pin="SHIELD" pad="Z1 Z2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:3360008/3"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="untitled">
<packages>
</packages>
<symbols>
</symbols>
<devicesets>
<deviceset name="TENSY2.0">
<gates>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="teensy">
<packages>
<package name="TEENSY">
<wire x1="15.24" y1="8.89" x2="-15.24" y2="8.89" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="-8.89" x2="15.24" y2="-8.89" width="0.1524" layer="21"/>
<wire x1="15.24" y1="8.89" x2="15.24" y2="6.35" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="8.89" x2="-15.24" y2="6.35" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="-8.89" x2="-15.24" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="1.016" x2="-15.24" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<wire x1="-15.24" y1="6.35" x2="-15.24" y2="1.016" width="0.1524" layer="21"/>
<wire x1="15.24" y1="6.35" x2="15.24" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="-6.35" x2="15.24" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="-6.35" x2="-15.24" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-6.35" x2="15.24" y2="-8.89" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="6.35" x2="15.24" y2="6.35" width="0.1524" layer="21"/>
<pad name="GND" x="-13.97" y="-7.62" drill="1.016" diameter="1.8796" shape="square" rot="R90"/>
<pad name="B7" x="-1.27" y="-7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="D2" x="6.35" y="-7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="D3" x="8.89" y="-7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="D0" x="1.27" y="-7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="D1" x="3.81" y="-7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="D4" x="13.97" y="5.08" drill="1.016" diameter="1.8796" rot="R180"/>
<pad name="D5" x="13.97" y="-5.08" drill="1.016" diameter="1.8796" rot="R180"/>
<pad name="D6" x="13.97" y="7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="D7" x="11.43" y="7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="C6" x="11.43" y="-7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="C7" x="13.97" y="-7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="F7" x="1.27" y="7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="F6" x="-1.27" y="7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="F5" x="-3.81" y="7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="F4" x="-6.35" y="7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="F1" x="-8.89" y="7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="F0" x="-11.43" y="7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="REF" x="-3.81" y="5.08" drill="1.016" diameter="1.8796" rot="R180"/>
<pad name="GRND1" x="13.97" y="0" drill="1.016" diameter="1.8796" rot="R180"/>
<pad name="E6" x="-3.81" y="-5.08" drill="1.016" diameter="1.8796"/>
<pad name="B0" x="-11.43" y="-7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="B1" x="-8.89" y="-7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="B2" x="-6.35" y="-7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="B3" x="-3.81" y="-7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="B4" x="8.89" y="7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="B5" x="6.35" y="7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="B6" x="3.81" y="7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="+5V" x="-13.97" y="7.62" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="5V2" x="13.97" y="-2.54" drill="1.016" diameter="1.8796" rot="R180"/>
<pad name="RST" x="13.97" y="2.54" drill="1.016" diameter="1.8796" rot="R180"/>
<text x="3.175" y="1.905" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-15.748" y="-8.255" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-15.24" y="-11.43" size="1.27" layer="51" font="vector">Licensed Under Creative Commons</text>
<text x="-15.24" y="-13.97" size="1.27" layer="51" font="vector">Attribution-ShareAlike 3.0 Unported </text>
<text x="-15.24" y="-16.51" size="1.27" layer="51" font="vector">Designed by Tamir Emran</text>
<text x="-15.24" y="-19.05" size="1.27" layer="51" font="vector">July 2011</text>
</package>
</packages>
<symbols>
<symbol name="TEENSY">
<wire x1="-7.62" y1="35.56" x2="7.62" y2="35.56" width="0.254" layer="94"/>
<wire x1="7.62" y1="35.56" x2="7.62" y2="-33.02" width="0.254" layer="94"/>
<wire x1="7.62" y1="-33.02" x2="-7.62" y2="-33.02" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-33.02" x2="-7.62" y2="35.56" width="0.254" layer="94"/>
<text x="-5.08" y="38.1" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-5.08" y="2.54" size="1.778" layer="96" font="vector" rot="R270">&gt;VALUE</text>
<text x="-30.48" y="-43.18" size="1.27" layer="97" font="vector">Creative Commons Attribution-ShareAlike 3.0 Unported License</text>
<text x="-5.08" y="-38.1" size="1.27" layer="97" font="vector">Teensy 2.0</text>
<text x="-17.78" y="-48.26" size="1.27" layer="97" font="vector">Library Designed by Tamir Emran</text>
<text x="-5.08" y="-53.34" size="1.27" layer="97" font="vector">July 2011</text>
<pin name="_GND" x="-12.7" y="33.02" length="middle"/>
<pin name="_B7" x="-12.7" y="30.48" length="middle"/>
<pin name="_D0" x="-12.7" y="27.94" length="middle"/>
<pin name="_D1" x="-12.7" y="25.4" length="middle"/>
<pin name="_D2" x="-12.7" y="22.86" length="middle"/>
<pin name="_D3" x="-12.7" y="20.32" length="middle"/>
<pin name="_D4" x="-12.7" y="17.78" length="middle"/>
<pin name="_D5" x="-12.7" y="15.24" length="middle"/>
<pin name="_D6" x="-12.7" y="12.7" length="middle"/>
<pin name="_D7" x="-12.7" y="10.16" length="middle"/>
<pin name="_C6" x="-12.7" y="-12.7" length="middle"/>
<pin name="_C7" x="-12.7" y="-15.24" length="middle"/>
<pin name="5V" x="12.7" y="33.02" length="middle" rot="R180"/>
<pin name="_B6" x="12.7" y="30.48" length="middle" rot="R180"/>
<pin name="_B5" x="12.7" y="27.94" length="middle" rot="R180"/>
<pin name="_B4" x="12.7" y="25.4" length="middle" rot="R180"/>
<pin name="_B3" x="12.7" y="22.86" length="middle" rot="R180"/>
<pin name="_B2" x="12.7" y="20.32" length="middle" rot="R180"/>
<pin name="_B1" x="12.7" y="17.78" length="middle" rot="R180"/>
<pin name="_B0" x="12.7" y="15.24" length="middle" rot="R180"/>
<pin name="_E6" x="12.7" y="10.16" length="middle" rot="R180"/>
<pin name="_GND1" x="12.7" y="-27.94" length="middle" rot="R180"/>
<pin name="_REF" x="12.7" y="2.54" length="middle" rot="R180"/>
<pin name="_F0" x="12.7" y="-2.54" length="middle" rot="R180"/>
<pin name="_F1" x="12.7" y="-5.08" length="middle" rot="R180"/>
<pin name="_F4" x="12.7" y="-10.16" length="middle" rot="R180"/>
<pin name="_F5" x="12.7" y="-12.7" length="middle" rot="R180"/>
<pin name="_F6" x="12.7" y="-15.24" length="middle" rot="R180"/>
<pin name="_F7" x="12.7" y="-17.78" length="middle" rot="R180"/>
<pin name="_5V2" x="12.7" y="-22.86" length="middle" rot="R180"/>
<pin name="_RST" x="12.7" y="-25.4" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TEENSY" prefix="_">
<description>&lt;b&gt;Teensy 2.0&lt;/b&gt;&lt;br&gt;
Original Design by Clint Fisher&lt;br&gt;
Modified Design by Tamir Emran&lt;br&gt;
Licensed Under Creative Commons Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)</description>
<gates>
<gate name="G$1" symbol="TEENSY" x="0" y="-2.54"/>
</gates>
<devices>
<device name="" package="TEENSY">
<connects>
<connect gate="G$1" pin="5V" pad="+5V"/>
<connect gate="G$1" pin="_5V2" pad="5V2"/>
<connect gate="G$1" pin="_B0" pad="B0"/>
<connect gate="G$1" pin="_B1" pad="B1"/>
<connect gate="G$1" pin="_B2" pad="B2"/>
<connect gate="G$1" pin="_B3" pad="B3"/>
<connect gate="G$1" pin="_B4" pad="B4"/>
<connect gate="G$1" pin="_B5" pad="B5"/>
<connect gate="G$1" pin="_B6" pad="B6"/>
<connect gate="G$1" pin="_B7" pad="B7"/>
<connect gate="G$1" pin="_C6" pad="C6"/>
<connect gate="G$1" pin="_C7" pad="C7"/>
<connect gate="G$1" pin="_D0" pad="D0"/>
<connect gate="G$1" pin="_D1" pad="D1"/>
<connect gate="G$1" pin="_D2" pad="D2"/>
<connect gate="G$1" pin="_D3" pad="D3"/>
<connect gate="G$1" pin="_D4" pad="D4"/>
<connect gate="G$1" pin="_D5" pad="D5"/>
<connect gate="G$1" pin="_D6" pad="D6"/>
<connect gate="G$1" pin="_D7" pad="D7"/>
<connect gate="G$1" pin="_E6" pad="E6"/>
<connect gate="G$1" pin="_F0" pad="F0"/>
<connect gate="G$1" pin="_F1" pad="F1"/>
<connect gate="G$1" pin="_F4" pad="F4"/>
<connect gate="G$1" pin="_F5" pad="F5"/>
<connect gate="G$1" pin="_F6" pad="F6"/>
<connect gate="G$1" pin="_F7" pad="F7"/>
<connect gate="G$1" pin="_GND" pad="GND"/>
<connect gate="G$1" pin="_GND1" pad="GRND1"/>
<connect gate="G$1" pin="_REF" pad="REF"/>
<connect gate="G$1" pin="_RST" pad="RST"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PJRC" package="TEENSY">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="1.2" drill="0.9">
<clearance class="0" value="0.0254"/>
</class>
</classes>
<parts>
<part name="_1" library="teensy" deviceset="TEENSY" device=""/>
<part name="J1" library="Wurth_Elektronik_Electromechanic_Input-Output_Connectors_rev19a" library_urn="urn:adsk.eagle:library:488835" deviceset="618009211821" device="" package3d_urn="urn:adsk.eagle:package:3360008/3"/>
<part name="J2" library="Wurth_Elektronik_Electromechanic_Input-Output_Connectors_rev19a" library_urn="urn:adsk.eagle:library:488835" deviceset="618009211821" device="" package3d_urn="urn:adsk.eagle:package:3360008/3"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="-7.62" y="91.44" size="1.778" layer="91">Port A</text>
<text x="-7.62" y="43.18" size="1.778" layer="91">Port B</text>
<text x="25.4" y="86.36" size="1.778" layer="91">Data 2</text>
<text x="25.4" y="91.44" size="1.778" layer="91">Data 3</text>
<text x="25.4" y="96.52" size="1.778" layer="91">Data 4</text>
<text x="25.4" y="81.28" size="1.778" layer="91">Data 1</text>
<text x="25.4" y="35.56" size="1.778" layer="91">RDY</text>
<text x="25.4" y="40.64" size="1.778" layer="91">End</text>
<text x="25.4" y="45.72" size="1.778" layer="91">DTR</text>
<text x="25.4" y="68.58" size="1.778" layer="91">ACK</text>
<text x="20.32" y="127" size="1.778" layer="91" rot="R90">RXT</text>
<text x="17.78" y="127" size="1.778" layer="91" rot="R90">TXT</text>
</plain>
<instances>
<instance part="_1" gate="G$1" x="78.74" y="134.62" smashed="yes" rot="R90">
<attribute name="NAME" x="40.64" y="129.54" size="1.778" layer="95" font="vector" rot="R90"/>
<attribute name="VALUE" x="76.2" y="129.54" size="1.778" layer="96" font="vector"/>
</instance>
<instance part="J1" gate="G$1" x="15.24" y="91.44" smashed="yes" rot="R270">
<attribute name="NAME" x="15.24" y="73.66" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="12.7" y="73.66" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="J2" gate="G$1" x="15.24" y="45.72" smashed="yes" rot="R270">
<attribute name="NAME" x="15.24" y="27.94" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="12.7" y="27.94" size="1.778" layer="96" rot="R270"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="N$3" class="0">
</net>
<net name="N$1" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="1"/>
<wire x1="25.4" y1="81.28" x2="48.26" y2="81.28" width="0.1524" layer="91"/>
<pinref part="_1" gate="G$1" pin="_B7"/>
<wire x1="48.26" y1="81.28" x2="48.26" y2="121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="2"/>
<wire x1="25.4" y1="86.36" x2="50.8" y2="86.36" width="0.1524" layer="91"/>
<pinref part="_1" gate="G$1" pin="_D0"/>
<wire x1="50.8" y1="86.36" x2="50.8" y2="121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="3"/>
<wire x1="25.4" y1="91.44" x2="53.34" y2="91.44" width="0.1524" layer="91"/>
<pinref part="_1" gate="G$1" pin="_D1"/>
<wire x1="53.34" y1="91.44" x2="53.34" y2="121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="4"/>
<wire x1="25.4" y1="96.52" x2="60.96" y2="96.52" width="0.1524" layer="91"/>
<pinref part="_1" gate="G$1" pin="_D4"/>
<wire x1="60.96" y1="96.52" x2="60.96" y2="121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
</net>
<net name="N$7" class="0">
<segment>
<pinref part="_1" gate="G$1" pin="_D5"/>
<pinref part="J2" gate="G$1" pin="1"/>
<wire x1="63.5" y1="121.92" x2="63.5" y2="35.56" width="0.1524" layer="91"/>
<wire x1="63.5" y1="35.56" x2="25.4" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="_1" gate="G$1" pin="_D6"/>
<pinref part="J2" gate="G$1" pin="2"/>
<wire x1="66.04" y1="121.92" x2="66.04" y2="40.64" width="0.1524" layer="91"/>
<wire x1="66.04" y1="40.64" x2="25.4" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="_1" gate="G$1" pin="_D7"/>
<pinref part="J2" gate="G$1" pin="3"/>
<wire x1="68.58" y1="121.92" x2="68.58" y2="45.72" width="0.1524" layer="91"/>
<wire x1="68.58" y1="45.72" x2="25.4" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="6"/>
<wire x1="2.54" y1="83.82" x2="2.54" y2="68.58" width="0.1524" layer="91"/>
<pinref part="_1" gate="G$1" pin="_C6"/>
<wire x1="2.54" y1="68.58" x2="91.44" y2="68.58" width="0.1524" layer="91"/>
<wire x1="91.44" y1="68.58" x2="91.44" y2="121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="_1" gate="G$1" pin="_D2"/>
<wire x1="20.32" y1="116.84" x2="20.32" y2="132.08" width="0.1524" layer="91"/>
<wire x1="55.88" y1="121.92" x2="55.88" y2="111.76" width="0.1524" layer="91"/>
<wire x1="55.88" y1="111.76" x2="20.32" y2="111.76" width="0.1524" layer="91"/>
<wire x1="20.32" y1="111.76" x2="20.32" y2="116.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="_1" gate="G$1" pin="_D3"/>
<wire x1="58.42" y1="121.92" x2="58.42" y2="109.22" width="0.1524" layer="91"/>
<wire x1="58.42" y1="109.22" x2="17.78" y2="109.22" width="0.1524" layer="91"/>
<wire x1="17.78" y1="109.22" x2="17.78" y2="129.54" width="0.1524" layer="91"/>
<wire x1="17.78" y1="132.08" x2="17.78" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>

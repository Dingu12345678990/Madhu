<%-- 
    Document   : BillingInvoice
    Created on : 9 Jun, 2016, 2:44:28 PM
    Author     : miracle
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Billing Invoice</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href='<s:url value="/includes/css/style_1.css"/>'
              type="text/css"/>

        <link rel="stylesheet" href='<s:url value="/includes/css/jquery-ui.css"/>'
              type="text/css"/>

        <link rel="stylesheet" href='<s:url value="/includes/css/helpText.css"/>' type="text/css"/>

        <link rel="stylesheet" href='<s:url value="/includes/css/dhtmlxcalendar.css"/>'
              type="text/css"/>
        <link rel="stylesheet" href='<s:url value="/includes/css/dhtmlxcalendar_omega.css"/>' type="text/css"/>

        <script type="text/JavaScript" src="<s:url value="/includes/js/DateValidation.js"/>"></script>
        <script language="JavaScript"  src='<s:url value="/includes/js/jquery-1.9.1.js"></s:url>'></script>
        <script language="JavaScript"  src='<s:url value="/includes/js/jquery-ui.js"/>'></script>
        <script type="text/JavaScript"  src='<s:url value="/includes/js/overlay.js"/>'></script>

        <script type="text/JavaScript" src="<s:url value="/includes/js/CalendarTime.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/AppConstants.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/GeneralAjax.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/tpvalidations.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/common.js"/>"></script>
        <script language="JavaScript"
        src='<s:url value="/includes/js/dhtmlxcalendar.js"/>'></script>

        <script>
            $(function() {
                $( document ).tooltip();
            });
        </script>

        <script>
            var myCalendar;
            function doOnLoad() {
                myCalendar = new dhtmlXCalendarObject(["OriginpnetDate","OriginplntDate","DestinationpnetDate","DestinationplntDate","FinancialInformationGateArrival","FinancialInformationGateAdmitted","FinancialInformationLoaded","FinancialInformationActualPU","FinancialInformationActualDelivery","FinancialInformationFreightBillRecieved"]);
                myCalendar.setSkin('omega');
                myCalendar.setDateFormat("%m/%d/%Y");
                myCalendar.hideTime();
            }
        </script>

        <script>
            $(function() {
                $( "#datepicker" ).datepicker();
                $( "#datepickerfrom" ).datepicker();
            });

        </script>

        <script type="text/javascript"> 
            $(function() {
                $('#attach_box').click(function() {
                    $('#sec_box').show();
                    return false;
                });        
            });
            $(function() {
                $('#detail_link').click(function() {
                    $('#detail_box').show();
                    return false;
                });        
            });
        </script>
        <style>
            table td input {
                width: 98%;   
            }
            alignleft {
                float: left;

            }
            .alignright {
                width:250px;
                float:right;
                text-align: center;

            } 
            .alignright1 {
                width:250px;
                float:right;
                text-align: left;

            } 
            .CSSTableGenerator th{
                background: #3393ff;
                border-left: 1px solid #fff;
                text-align: center;
            }
            .CSSTableGenerator{
                border: 1px solid #3393ff;
            }
            .CSSTableGenerator tr:nth-child(even) { 
                background-color:#ffffff;
            }
            .CSSTableGenerator tr:nth-child(odd) { 
                background-color:#ffffff;
            }
            #orderAck{
                font-family: verdana;
                color: #0174DF;
                font-size: 30px;
                float: right;
                margin-left: 655px;

            }
/*            #orderAck1{
                font-family: verdana;
                color: #0174DF;
                font-size: 30px;
                margin-left: 480px;
            }*/
            #textareas{
                margin-left: 38%;
                float: left;

            }
            ::placeholder{
                position: absolute;
            }
            .shipTo{
                float: right;
                width:100%;
                alignment-adjust: right;
                /*                margin-left: 100%;*/

            }
            labels{
                display: inline-block;
                float: left;
                width: 100%;
                /*                            text-align: left;*/
            }
            inputs {
                display: inline-block;
                float: right;
                width: 100%;
                /*                            text-align: left;*/
            }
            /*            label{
                            display: inline-block;
                            float: left;
                            clear: left;
                            width: 25%;
                            text-align: right;
                        }
                        input {
                            display: inline-block;
                            float: left;
                        }*/
            
            .input_style{ width:255px; } 
            
            #results input{
                border:0;
            }
            
            .invoice_fields input{
                 border:0;
            }
        </style>
    </head>

    <body onload="doOnLoad();">





        <div id="wrapper">      




            <!--  <div id="main">-->
            <div id ="head">

                <div id="logo">
                    <%-- <s:include value="/includes/template/head.jsp"/>       
                     <h3 class="head_title"><b>PLS PRO 1.0 </b></h3>
                     <gcse:search></gcse:search> --%>
                    <div>
                        <table border-none:="0">
                            <tr>
                                <td><div> <h1><img src="${pageContext.request.contextPath}/includes/images/miracle-logo-dark.jpg" width="250px" height="60px" style=""/> </div></td>
                                <td><div id="orderAck">INVOICE</div></td>
                            </tr>

                        </table>
                    </div>
                </div>

            </div>

            <div id="site_content">

                <div class="content">
                    <div class="content_item">
                        <!-- heading for the content -->
                        <%
                            if (session.getAttribute("resultMessage") != null) {
                                out.print(session.getAttribute("resultMessage"));
                                session.removeAttribute("resultMessage");
                            }
                        %>
                        <div>

                            <div>

                                <!-- end of the heading tag -->
                                <!-- content div start -->
                                <div style="alignment-adjust:central;" >
                                    <s:form action="#" method="post" name="plsForm1" id="plsForm1" theme="simple">
                                        <table>                               
                                            <tr><td colspan="8">                                               
                                                    
                                                        <table  border="0" style="width:831px">
                                                            <tr>
                                                                <td class="alignleft" style="color: #0174DF;"> <div class="row"> Miracle Software Systems, Inc.</div></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="alignleft"  style="color: #0174DF;"><div class="row">Global Headquarters</div></td>                        
                                                            </tr>
                                                            <tr>
                                                                <td class="alignleft"  style="color: #0174DF;"><div class="row">45625 Grand River Avenue</div></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="alignleft"  style="color: #0174DF;"><div class="row">Novi, MI - USA( 48374 )</div></td> 
                                                            </tr>
                                                            <tr>
                                                                <td class="alignleft"  style="color: #0174DF;"><div class="row">Ph: (248)-233-1100</div></td> 
                                                            </tr>
                                                            <tr>
                                                                <td class="alignleft"  style="color: #0174DF;"><div class="row">E : info@miraclesoft.com</div> </td> 
                                                     
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    
                                                       
                                                </td>
                                         
                                                <td width="50%">
                                                    <table border="1" class="invoice_fields">
                                                        <tr>
                                                         <th style="background:#0174DF"><label for="Name/Dept">Invoice&nbsp;#</label></th>
                                                          <th style="background:#0174DF"><label for="Name/Dept">Date</label></th>
                                                        </tr>
                                                        <tr>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                                           

                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                        </tr>
                                                                <tr>
                                                         <th style="background:#0174DF"><label for="Name/Dept">Customer&nbsp;Id</label></th>
                                                         <th style="background:#0174DF"><label for="Name/Dept">Terms</label></th>
                                                                </tr>
                                                                <tr>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                                            

                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                        </tr>
                                                                <tr>
                                                         <th style="background:#0174DF"><label for="Name/Dept">PO&nbsp;#</label></th>
                                                           <th style="background:#0174DF"><label for="Name/Dept">PODate</label></th></tr>
                                                                <tr>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                                          

                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                          
                                                </tr>
                                                <br>
                                                <tr></tr>
                                                <tr></tr>
                                            <!-- basic info END -->                                
                                            <!-- start of origin -->
                                            
                                            
                                            <br>
                                            <table>
                                                    <td colspan="4">
                                                    <table border="0" width="100%" >
                                                        <tr>
                                                            <td style="background:#0174DF; height: 20px; width:333px" >
                                                                <font color="white"> <b>&nbsp;&nbsp;VENDOR </b></font>                                                 
                                                            </td>
                                                            
                                                            <td style="background:#0174DF; width:333px">
                                                                <font color="white"> <b>&nbsp;&nbsp;BUILD&nbsp;TO </b> </font>
                                                            </td>
                                                            
                                                            <td style="background:#0174DF; width:333px; align:right">
                                                                <font color="white"> <b>&nbsp;&nbsp;SHIP&nbsp;TO </b> </font>
                                                            </td>


                                                        </tr>
                                                    </table>

                                                </td>
                                         
                                            <tr>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td  width="392px" style=" border: 0;" class=" ">
                                                                <table>
                                                                    <tr><td><label for="Name/Dept">ATTN:Name/Dept:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">Company Name:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">Street Name:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">City Name:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">PhoneNumber:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">Email Address:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>

                                                                </table>
                                                            </td>
                                                             <td  width="381px" style=" border: 0; margin-right: 50%" class=" ">
                                                                <table>
                                                                    <tr><td><label for="Name/Dept">ATTN:Name/Dept:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">Company Name:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">Street Name:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">City Name:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">PhoneNumber:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">Email Address:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>

                                                            <td  width="50px" style=" border: 0;" class=" ">
                                                                <table>
                                                                    <tr><td><label for="Name/Dept">ATTN:Name/Dept:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">Company Name:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">Street Name:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">City Name:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">PhoneNumber:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                    <tr><td><label for="Name/Dept">Email Address:</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="input_style"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>

                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            </table>
                                            <table align="left" id="results" style="width:1114px;border-collapse: collapse;"
                                                   border="0" cellpadding="0" cellspacing="0" class="CSSTableGenerator">

                                                <tr style="height:20px">

                                                    <th style="width: 25px;background:#0174DF">DESCRIPTION</th>
                                                    <th style="width: 25px;background:#0174DF">QTY</th>

                                                    <th style="width: 25px;background:#0174DF">UNIT&nbsp;PRICE</th>
                                                    <th style="width: 25px;background:#0174DF">TOTAL</th>

                                                </tr>
                                                <tr height="20px">

<!--                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td>-->
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td>
                                                </tr>
                                                <tr height="25px">
                                                    <!--                                                <td>B222</td>
                                                                                                    <td>Men's Tall-M</td>
                                                                                                    <td>5</td>
                                                                                                    <td>20.00</td>
                                                                                                    <td>100.00</td>-->
<!--                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>-->
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                </tr>
                                                <tr height="25px">
                                                    <!--                                                <td>C333</td>
                                                                                                    <td>Children's-S</td>
                                                                                                    <td>10</td>
                                                                                                    <td>5.00</td>
                                                                                                    <td>50.00</td>-->
                                                    <!--<td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>-->
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                </tr>
                                                <tr height="25px">
                                                    <!--                                                <td>D444</td>
                                                                                                    <td>Men's-XL</td>
                                                                                                    <td>5</td>
                                                                                                    <td>10.00</td>
                                                                                                    <td>50.00</td>-->
                                                    <!--<td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>-->
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                </tr>
                                                <tr height="25px">
                                                    <!--                                                <td></td>
                                                                                                    <td></td>
                                                                                                    <td></td>
                                                                                                    <td></td>
                                                                                                    <td>00.00</td>-->
                                                    <!--<td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>-->
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                </tr>
                                                <tr height="25px">
                                                    <!--                                                <td></td>
                                                                                                    <td></td>
                                                                                                    <td></td>
                                                                                                    <td></td>
                                                                                                    <td>00.00</td>-->
                                                    <!--<td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>-->
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                </tr>
                                                <tr height="25px">
                                                    <!--                                                <td></td>
                                                                                                    <td></td>
                                                                                                    <td></td>
                                                                                                    <td></td>
                                                                                                    <td>00.00</td>-->
                                                    <!--<td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>-->
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                </tr>
                                                <tr height="25px">
                                                    <!--<td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>-->
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                </tr>
                                                <tr height="25px">
                                                    <!--<td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>-->
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>
                                                </tr>

                                            </table >
                                            <table class="alignright1" style="width:406px;length:40px ; background:#CEECF5;margin-right:3.2cm;" border="1"  cellpadding="0" cellspacing="0" class="CSSTableGenerator">
                                                <tr height="25px">
                                                    <td style="color: black;width: 63.2%">SUBTOTAL</td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td>
                                                    <!--                                               
                                                    
                                                    
                                                                                                </tr>
                                                                                                <tr height="25px">
                                                                                                    <td style="color: black"> TAX (3.8%)</td>
                                                                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td>
                                                    <!--                                                <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td></td>-->


                                                </tr>
                                                <tr height="25px">
                                                    <td style="color: black">TAX(3.8%)</td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td>


                                                </tr>
<!--                                                <tr height="25px">
                                                    <td style="color: black">SHIPPING/HANDLING</td>
                                                    <td><s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td>


                                                </tr>-->
                                                <tr height="25px">
                                                    <td style="color: black">TOTAL</td>

                                                    <td>
                                                        <s:textfield name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/></td>
                                                </tr>
                                            </table>

                                            <div class="row">
                                                <table>
                                                    <tr>


                                                        <td>
                                                            <s:textarea name="logisticsLoadTenderingXml.ShipperInstructions" id="ShipperInstructions" style="text-align:center"  onchange="fieldLengthValidator(this);" cols="71" rows="1" wrap="true" tabindex="60" placeholder="Thank you for your business!"></s:textarea>
                                                        </td>
                                                    </tr>
                                                </table> 

                                                       
                                            </div >
                                            <br><br><br>
                                            <div style="margin-bottom:2%">
                                            <strong><input type="button" value="Submit" class="button" onclick="saveSubmitToggleOverlay('submit');" tabindex="9" /></strong>
                                            </div>
                                        </s:form>
                                </div></div>
                        </div>
                        <!-- end of the conetnt -->


                    </div>
                </div>




            </div>
        </div>         

        <h4><div style=" width: 100%; font-family: 'trebuchet ms', sans-serif; font-size: 100%; height: 70px; padding: 20px 0 5px 0; text-align: center; color: #3393ff; margin: 0 0 0 0;">

                <p>For questions concerning this purchase order, please contact</p>
                <p>Name, (321) 456-7890, Email Address</p>
                <p>www.miraclesoft.com</p>
            </div> </h4>   

        <script>
            $('#textareas').watermark('Authorized<br/> * newline', {fallback: false});
        </script>
    </body>
</html>

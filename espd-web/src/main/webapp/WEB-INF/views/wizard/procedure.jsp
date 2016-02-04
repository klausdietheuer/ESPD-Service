<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:importAttribute name="agent"/>
<tiles:importAttribute name="flow"/>

<script>
    $(function () {
        $("#espdform").validate({
            errorContainer: $("div.errorContainer"),
            errorPlacement: function ($error, $element) {
                $element.parent().append($error);
            }
        });
        $("#ojsNumber").inputmask("9999/S 999-999999");
    });
</script>

<form:form id="espdform" role="form" class="form-horizontal" method="post" commandName="espd" data-toggle="validator">
    <tiles:insertDefinition name="viewChangeRole">
        <tiles:putAttribute name="agent" value="${agent}"/>
        <tiles:putAttribute name="page" value="${flow}/${agent == 'ca' ? 'eo' : 'ca'}/procedure"/>
    </tiles:insertDefinition>
    <div class="panel-default">
        <tiles:insertDefinition name="progress">
            <tiles:putAttribute name="procedure" value="true"/>
        </tiles:insertDefinition>
        <div class="errorContainer alert alert-danger" style="display: none">
            <ul class="fa-ul">
                <li>
                    <i class="info-label fa fa-exclamation-triangle fa-lg fa-li"></i>
                        ${div18n['correct_errors']}
                    <div class="errorLabelContainer"></div>
                </li>
            </ul>
        </div>
        <div class="paragraph">
            <h2>${span18n['createca_header']}</h2>
        </div>
        <div class="espd-panel panel panel-default">
            <div class="espd-panel-heading" data-toggle="collapse" data-target="#ojsdiv">
                    ${span18n['createca_info_pub']}
            </div>
            <div id="ojsdiv" class="panel-body collapse in">
                <div class="alert alert-espd-info" style="border: 1px dotted blue; background-color: #D8D8D8;">
                        ${div18n['createca_to_be_filled_alert']}
                    <div class="form-group">
                        <label class="control-label col-md-4">${span18n['createca_ojs_label']}</label>

                        <div class="col-md-8">
                            <form:input cssClass="form-control" path="ojsNumber"
                                        placeholder="[ ][ ][ ][ ]/S [ ][ ][ ]–[ ][ ][ ][ ][ ][ ]"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">${span18n['createca_ojs_url']}</label>
                        <div class="col-md-8">
                            <form:input cssClass="form-control" path="tedUrl" placeholder="${i18n['createca_ojs_url']}"/>
                        </div>
                    </div>
                    ${span18n['createca_official_journal_alert']}
                </div>
            </div>
        </div>
        <div class="espd-panel panel panel-default">
            <div class="espd-panel-heading" data-toggle="collapse" data-target="#cadiv">
                    ${span18n['createca_contact_details_ca']}
            </div>
            <div id="cadiv" class="panel-body collapse in">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-4">${span18n['createca_name']}</label>

                            <div class="col-md-8">
                                <form:input cssClass="form-control" path="authority.name"
                                            placeholder="${i18n['createca_name_placeholder']}"
                                            data-i18n="createca_name_placeholder" required="true"/>
                                <span class="error"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-8 col-md-offset-4">
                                <form:errors path="authority.name" cssClass="alert-danger"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class=" form-group ">
                            <label class="control-label col-md-4">${span18n['createca_country']}</label>

                            <div class="col-md-8">
                                <tiles:insertDefinition name="countries">
                                    <tiles:putAttribute name="field" value="authority.country"/>
                                </tiles:insertDefinition>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="espd-panel panel panel-default">
            <div class="espd-panel-heading" data-toggle="collapse"
                 data-target="#ppdiv">${span18n['createca_info_procurement_proc']}</div>
            <div id="ppdiv" class="panel-body collapse in">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-4">${span18n['createca_procurer_name']}</label>

                            <div class="col-md-8">
                                <form:input cssClass="form-control" path="procedureTitle"
                                            placeholder="${i18n['createca_procurer_name_placeholder']}"
                                            data-i18n="createca_procurer_name_placeholder"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-4">${span18n['createca_title_or_short_desc']}</label>

                            <div class="col-md-8">
                                <form:textarea path="procedureShortDesc" cssStyle="resize: none" rows="4" cols="20"
                                               cssClass="form-control"
                                               placeholder="${i18n['createca_title_or_short_desc_placeholder']}"
                                               data-i18n="createca_title_or_short_desc_placeholder"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                    ${span18n['createca_file_ref_ca']}
                            </label>

                            <div class="col-md-8">
                                <form:input cssClass="form-control" path="fileRefByCA"
                                            placeholder="${i18n['createca_file_ref_ca_placeholder']}"
                                            data-i18n="createca_file_ref_ca_placeholder"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${agent == 'eo'}">
            <div class="paragraph">
                <h2>${span18n['createeo_header']}</h2>
            </div>
            <div class="espd-panel panel panel-default">
                <div class="espd-panel-heading" data-toggle="collapse"
                     data-target="#createeo_info_eo_div">${span18n['createeo_info_eo']}</div>
                <div id="createeo_info_eo_div" class="collapse in">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">${span18n['createeo_name']}</label>

                                    <div class="col-md-8">
                                        <form:input cssClass="form-control" path="economicOperator.name"
                                                    placeholder="${i18n['createeo_name_placeholder']}"
                                                    data-i18n="createeo_name_placeholder"/>
                                    </div>
                                </div>
                                <tiles:insertDefinition name="partyInfo">
                                    <tiles:putAttribute name="field" value="economicOperator"/>
                                    <tiles:putAttribute name="address" value="true"/>
                                </tiles:insertDefinition>
                                <div class="form-group">
                                    <label class="control-label col-md-4">${span18n['createeo_internet_addr_if_exists']}</label>

                                    <div class="col-md-8">
                                        <form:input cssClass="form-control" path="economicOperator.website"
                                                    placeholder="${i18n['createeo_internet_addr_if_exists_placeholder']}"
                                                    data-i18n="createeo_internet_addr_if_exists_placeholder"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <tiles:insertDefinition name="partyInfo">
                                    <tiles:putAttribute name="field" value="economicOperator"/>
                                    <tiles:putAttribute name="contacts" value="true"/>
                                </tiles:insertDefinition>
                                <div class="form-group">
                                    <label class="control-label col-md-4">${span18n['createeo_contact_person']}</label>

                                    <div class="col-md-8">
                                        <form:input cssClass="form-control" path="economicOperator.contactName"
                                                    placeholder="${i18n['createeo_contact_person_placeholder']}"
                                                    data-i18n="createeo_contact_person_placeholder"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-4">${span18n['createeo_vat']}</label>

                                    <div class="col-md-8">
                                        <form:input cssClass="form-control" path="economicOperator.vatNumber"
                                                    placeholder="${i18n['createeo_vat_placeholder']}"
                                                    data-i18n="createeo_vat_placeholder"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-4">${span18n['createeo_another_vat']}</label>

                                    <div class="col-md-8">
                                        <form:input cssClass="form-control" path="economicOperator.anotherNationalId"
                                                    placeholder="${i18n['createeo_another_vat_placeholder']}"
                                                    data-i18n="createeo_another_vat_placeholder"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label col-md-6">
                                            ${span18n['createeo_is_eo_sized']}
                                    <span data-i18n="createeo_is_eo_sized_tooltip"
                                          title="${i18n['createeo_is_eo_sized_tooltip']}" data-toggle="tooltip"></span>
                                    </label>

                                    <div class="col-md-6">
                                        <form:checkbox path="economicOperator.isSmallSizedEnterprise"
                                                       cssClass="radioslide checktoggle form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label col-md-6">${span18n['createeo_if_proc_reserved']}</label>

                                    <div class="col-md-6">
                                        <form:checkbox path="procurementReserved.answer" data-target="#disworkers-form"
                                                       cssClass="radioslide checktoggle form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12" id="disworkers-form" style="display:none">
                                <div class=" form-group">
                                    <label class="control-label col-md-6">${span18n['createeo_percentage_disworkers']}</label>

                                    <div class="col-md-6">
                                        <form:input cssClass="form-control" path="procurementReserved.doubleValue1"
                                                    number="true"
                                                    placeholder="${i18n['createeo_percentage_disworkers_placeholder']}"
                                                    data-i18n="createeo_percentage_disworkers_placeholder"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-6">${span18n['createeo_disworkers_details']}</label>

                                    <div class="col-md-6">
                                        <form:input cssClass="form-control" path="procurementReserved.description1"
                                                    placeholder="${i18n['createeo_disworkers_details_placeholder']}"
                                                    data-i18n="createeo_disworkers_details_placeholder"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label col-md-6">${span18n['createeo_eo_approved_cert']}</label>

                                    <div class="col-md-6">
                                        <form:checkbox path="eoRegistered.answer" data-target="#reg-official-yes"
                                                       data-target-invert="#reg-official-no"
                                                       cssClass="radioslide checktoggle form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div id="reg-official-yes" style="display:none"><%-- [IF YES] --%>
                                <div class="col-md-12 alert alert-espd-info"
                                     style="border: 1px dotted blue; background-color: #D8D8D8;">${span18n['createeo_answer_following_parts']}</div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-6">${span18n['createeo_provide_regnumber']}</label>

                                        <div class="col-md-6">
                                            <form:input cssClass="form-control" path="eoRegistered.description1"
                                                        placeholder="${i18n['createeo_provide_regnumber_placeholder']}"
                                                        data-i18n="createeo_provide_regnumber_placeholder"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-6">${span18n['createeo_cert_e_avaliable']}</label>

                                        <div class="col-md-6">
                                            <form:input cssClass="form-control" path="eoRegistered.description2"
                                                        placeholder="${i18n['createeo_cert_e_avaliable_placeholder']}"
                                                        data-i18n="createeo_cert_e_avaliable_placeholder"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-6">${span18n['createeo_ref_for_cert']}</label>

                                        <div class="col-md-6">
                                            <form:input cssClass="form-control" path="eoRegistered.description3"
                                                        placeholder="${i18n['createeo_ref_for_cert_placeholder']}"
                                                        data-i18n="createeo_ref_for_cert_placeholder"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-6">${span18n['createeo_all_selection_covered']}</label>

                                        <div class="col-md-6">
                                            <form:checkbox path="eoRegistered.booleanValue1"
                                                           cssClass="radioslide checktoggle form-control"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="reg-official-no" style="display:none"><%-- [IF NO] --%>
                                <div class="col-md-12 alert alert-espd-info"
                                     style="border: 1px dotted blue; background-color: #D8D8D8;">
                                    <span data-i18n="createeo_add_complete_missing">${i18n['createeo_add_complete_missing']}</span>
                                </div>
                                <div class="col-md-12 ">
                                    <div class="form-group">
                                        <label class="control-label col-md-6"> ${span18n['createeo_eo_has_cert_soc']}</label>

                                        <div class="col-md-6">
                                            <form:input cssClass="form-control" path="eoRegistered.description4"
                                                        placeholder="${i18n['createeo_eo_has_cert_soc_placeholder']}"
                                                        data-i18n="createeo_eo_has_cert_soc_placeholder"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-6">${span18n['createeo_doc_e_avaliable']}</label>

                                        <div class="col-md-6">
                                            <form:input cssClass="form-control" path="eoRegistered.description5"
                                                        placeholder="${i18n['createeo_doc_e_avaliable_placeholder']}"
                                                        data-i18n="createeo_doc_e_avaliable_placeholder"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label col-md-6">${span18n['createeo_is_eo_proc_together']}</label>

                                    <div class="col-md-6">
                                        <form:checkbox path="eoParticipatingProcurementProcedure.answer"
                                                       data-target="#group-form"
                                                       cssClass="radioslide checktoggle form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div id="group-form" style="display:none"><%-- [IF YES] --%>
                                <div class="col-md-12 alert alert-espd-info"
                                     style="border: 1px dotted blue; background-color: #D8D8D8;">${span18n['createeo_ensure_others_espd']}</div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-6"> ${span18n['createeo_eo_group_role']}</label>

                                        <div class="col-md-6">
                                            <form:input cssClass="form-control"
                                                        path="eoParticipatingProcurementProcedure.description1"
                                                        placeholder="${i18n['createeo_eo_group_role_placeholder']}"
                                                        data-i18n="createeo_eo_group_role_placeholder"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-6"> ${span18n['createeo_other_eo_part']}</label>

                                        <div class="col-md-6">
                                            <form:input cssClass="form-control"
                                                        path="eoParticipatingProcurementProcedure.description2"
                                                        placeholder="${i18n['createeo_other_eo_part_placeholder']}"
                                                        data-i18n="createeo_other_eo_part_placeholder"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-6"> ${span18n['createeo_name_part_group']}</label>

                                        <div class="col-md-6">
                                            <form:input cssClass="form-control"
                                                        path="eoParticipatingProcurementProcedure.description3"
                                                        placeholder="${i18n['createeo_name_part_group_placeholder']}"
                                                        data-i18n="createeo_name_part_group_placeholder"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label col-md-6">${span18n['createeo_lots_concerned']}</label>

                                    <div class="col-md-6">
                                        <form:input cssClass="form-control" path="lotConcerned" id="lotConcerned"
                                                    placeholder="${i18n['createeo_lots_concerned_placeholder']}"
                                                    data-i18n="createeo_lots_concerned_placeholder"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="espd-panel panel panel-default">
                <div class="espd-panel-heading" data-toggle="collapse" data-target="#createeo_info_respresent_div">
                        ${span18n['createeo_info_respresent']}
                </div>
                <div id="createeo_info_respresent_div" class="collapse in">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12 alert alert-espd-info"
                                 style="border: 1px dotted blue; background-color: #D8D8D8;">
                                    ${span18n['createeo_person_empowered']}
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">${span18n['createeo_first_name']}</label>

                                    <div class="col-md-8">
                                        <form:input cssClass="form-control"
                                                    path="economicOperator.representative.firstName"
                                                    placeholder="${i18n['createeo_first_name_placeholder']}"
                                                    data-i18n="createeo_first_name_placeholder"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-4">${span18n['createeo_birth_date']}</label>

                                    <div class="col-md-8">
                                        <form:input path="economicOperator.representative.dateOfBirth"
                                                    cssClass="form-control datepicker"
                                                    placeholder="${i18n['createeo_birth_date_placeholder']}"
                                                    data-i18n="createeo_birth_date_placeholder"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">${span18n['createeo_last_name']}</label>

                                    <div class="col-md-8">
                                        <form:input cssClass="form-control"
                                                    path="economicOperator.representative.lastName"
                                                    placeholder="${i18n['createeo_last_name_placeholder']}"
                                                    data-i18n="createeo_last_name_placeholder"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-4">${span18n['createeo_birth_place']}</label>

                                    <div class="col-md-8">
                                        <form:input cssClass="form-control"
                                                    path="economicOperator.representative.placeOfBirth"
                                                    placeholder="${i18n['createeo_birth_place_placeholder']}"
                                                    data-i18n="createeo_birth_place_placeholder"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <tiles:insertDefinition name="partyInfo">
                                    <tiles:putAttribute name="field" value="economicOperator.representative"/>
                                    <tiles:putAttribute name="address" value="true"/>
                                </tiles:insertDefinition>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4" data-i18n="createca_email"><s:message
                                            code="createca_email"/></label>

                                    <div class="col-md-8">
                                        <form:input cssClass="form-control" path="economicOperator.representative.email"
                                                    placeholder="${i18n['createca_email_placeholder']}"
                                                    data-i18n="createca_email_placeholder"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-4" data-i18n="createca_telephone"><s:message
                                            code="createca_telephone"/></label>

                                    <div class="col-md-8">
                                        <form:input cssClass="form-control" path="economicOperator.representative.phone"
                                                    placeholder="${i18n['createca_telephone_placeholder']}"
                                                    data-i18n="createca_telephone_placeholder"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-4">${span18n['createeo_pos_act_in_capacity']}</label>

                                    <div class="col-md-8">
                                        <form:input cssClass="form-control"
                                                    path="economicOperator.representative.position"
                                                    placeholder="${i18n['createeo_pos_act_in_capacity_placeholder']}"
                                                    data-i18n="createeo_pos_act_in_capacity_placeholder"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label col-md-2">${span18n['createeo_detinfo_of_represent']}</label>

                                    <div class="col-md-10">
                                        <form:textarea path="economicOperator.representative.additionalInfo"
                                                       cssStyle="resize: none" rows="4" cols="20"
                                                       cssClass="form-control"
                                                       placeholder="${i18n['createeo_detinfo_of_represent_placeholder']}"
                                                       data-i18n="createeo_detinfo_of_represent_placeholder"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="espd-panel panel panel-default">
                <div class="espd-panel-heading" data-toggle="collapse" data-target="#createeo_info_reliance_div">
                        ${span18n['createeo_info_reliance']}
                </div>
                <div id="createeo_info_reliance_div" class="collapse in">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label class="control-label col-md-6">
                                        ${span18n['createeo_eo_rely_other_entities']}
                                </label>

                                <div class="col-md-6">
                                    <form:checkbox path="eoReliesCapacities.answer" data-target="#separate_espd_div"
                                                   cssClass="radioslide checktoggle form-control"/>
                                </div>
                            </div>
                            <div id="separate_espd_div" class="col-md-12 alert alert-espd-info"
                                 style="border: 1px dotted blue; background-color: #D8D8D8;margin-top: 15px; display: none;">
                                    ${span18n['createeo_separate_espd_sections_a_b']}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
    <tiles:insertDefinition name="footerButtons">
        <tiles:putAttribute name="prev" value="/filter"/>
        <tiles:putAttribute name="next" value="exclusion"/>
    </tiles:insertDefinition>
</form:form>

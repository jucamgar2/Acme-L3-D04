

<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" uri="http://www.the-acme-framework.org/"%>

<acme:form>
	<acme:input-moment code="authenticated.bulletin.form.label.instantiationMoment" path="instantiationMoment"/>
	<acme:input-textbox code="authenticated.bulletin.form.label.title" path="title"/>
	<acme:input-textbox code="authenticated.bulletin.form.label.message" path="message"/>
	<acme:input-checkbox code="authenticated.bulletin.form.label.critical" path="critical"/>
	<acme:input-url code="authenticated.bulletin.form.label.furtherInformationLink" path="furtherInformationLink"/>
</acme:form>

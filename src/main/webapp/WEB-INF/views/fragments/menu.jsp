<%--
- menu.jsp
-
- Copyright (C) 2012-2023 Rafael Corchuelo.
-
- In keeping with the traditional purpose of furthering education and research, it is
- the policy of the copyright owner to permit non-commercial use and redistribution of
- this software. It has been tested carefully, but it is not guaranteed for any particular
- purposes.  The copyright owner does not offer any warranties or representations, nor do
- they accept any liabilities with respect to them.
--%>

<%@page language="java" import="acme.framework.helpers.PrincipalHelper,acme.roles.Provider,acme.roles.Consumer"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="acme" uri="http://www.the-acme-framework.org/"%>

<acme:menu-bar code="master.menu.home">
	<acme:menu-left>
		<acme:menu-option code="master.menu.anonymous" access="isAnonymous()">
			<acme:menu-suboption code="master.menu.anonymous.favourite-link" action="http://www.example.com/"/>
			<acme:menu-suboption code="master.menu.anonymous.favourite-link-S1" action="https://www.realbetisbalompie.es/"/>
			<acme:menu-suboption code="master.menu.anonymous.favourite-link-S2" action="https://twitter.com/"/>
			<acme:menu-suboption code="master.menu.anonymous.favourite-link-S3" action="https://www.informatica.us.es/"/>
      <acme:menu-suboption code="master.menu.anonymous.favourite-link-S4" action="https://www.coolors.co/"/>
			<acme:menu-suboption code="master.menu.anonymous.favourite-link-S5" action="https://www.cadizcf.com/"/>
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.any">
			<acme:menu-suboption code="master.menu.any.course" action="/any/course/list"/>
			<acme:menu-suboption code="master.menu.any.peep" action="/any/peep/list"/>
			
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.authenticated" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.authenticated.note.list" action="/authenticated/note/list"/>
			<acme:menu-suboption code="master.menu.authenticated.offer.list" action="/authenticated/offer/list"/>
			<acme:menu-suboption code="master.menu.authenticated.bulletin.list" action="/authenticated/bulletin/list"/>
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.administrator" access="hasRole('Administrator')">
			<acme:menu-suboption code="master.menu.administrator.user-accounts" action="/administrator/user-account/list"/>
			<acme:menu-suboption code="master.menu.administrator.dashboard" action="/administrator/administrator-dashboard/show"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.populate-initial" action="/administrator/populate-initial"/>
			<acme:menu-suboption code="master.menu.administrator.populate-sample" action="/administrator/populate-sample"/>			
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.shut-down" action="/administrator/shut-down"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.system-configuration" action="/administrator/system-configuration/show" access="isAuthenticated()"/>
			<acme:menu-suboption code="master.menu.list.offer" action="/administrator/offer/list" access="isAuthenticated()"/>
			<acme:menu-suboption code="master.menu.list.banner" action="/administrator/banner/list" access="isAuthenticated()"/>
			<acme:menu-suboption code="master.menu.authenticated.bulletin.create" action="/administrator/bulletin/create" access="isAuthenticated()"/>
		</acme:menu-option>

		
		<acme:menu-option code="master.menu.lecturer" access="hasRole('Lecturer')">
			<acme:menu-suboption code="master.menu.lecturer.course" action="/lecturer/course/list"/>
			<acme:menu-suboption code="master.menu.lecturer.lecturer-dashboard" action="/lecturer/lecturer-dashboard/show"/>
			<acme:menu-suboption code="master.menu.lecturer.lecture" action="/lecturer/lecture/list-all"/>
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.company" access="hasRole('Company')">			
			<acme:menu-suboption code="master.menu.company.my-practica" action="/company/practicum/list"/>
			<acme:menu-suboption code="master.menu.company.company-dashboard" action="/company/company-dashboard/show"/>			
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.auditor" access="hasRole('Auditor')">
			<acme:menu-suboption code="master.menu.auditor.audit" action="/auditor/audit/list"/>
			<acme:menu-suboption code="master.menu.auditor.auditor-dashboard" action="/auditor/auditor-dashboard/show"/>
		</acme:menu-option>

		
		<acme:menu-option code="master.menu.assistant" access="hasRole('Assistant')">
			<acme:menu-suboption code="master.menu.assistant.tutorial" action="/assistant/tutorial/list"/>
			<acme:menu-suboption code="master.menu.assistant.dashboard" action="/assistant/assistant-dashboard/show"/>
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.student" access="hasRole('Student')">
			<acme:menu-suboption code="master.menu.student.enrolment" action="/student/enrolment/list"/>
			<acme:menu-suboption code="master.menu.student.course" action="/student/course/list"/>
			<acme:menu-suboption code="master.menu.student.dashboard" action="/student/student-dashboard/show"/>
		</acme:menu-option>
	</acme:menu-left>
	
				
		

	<acme:menu-right>
		<acme:menu-option code="master.menu.sign-up" action="/anonymous/user-account/create" access="isAnonymous()"/>
		<acme:menu-option code="master.menu.sign-in" action="/master/sign-in" access="isAnonymous()"/>
	
		
		<acme:menu-option code="master.menu.user-account" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.user-account.general-data" action="/authenticated/user-account/update"/>
			<acme:menu-suboption code="master.menu.user-account.become-provider" action="/authenticated/provider/create" access="!hasRole('Provider')"/>
			<acme:menu-suboption code="master.menu.user-account.provider" action="/authenticated/provider/update" access="hasRole('Provider')"/>
			<acme:menu-suboption code="master.menu.user-account.become-consumer" action="/authenticated/consumer/create" access="!hasRole('Consumer')"/>
			<acme:menu-suboption code="master.menu.user-account.consumer" action="/authenticated/consumer/update" access="hasRole('Consumer')"/>
			<acme:menu-suboption code="master.menu.authenticated.lecturer.create" action="/authenticated/lecturer/create" access="!hasRole('Lecturer')"/>
			<acme:menu-suboption code="master.menu.authenticated.lecturer.update" action="/authenticated/lecturer/update" access="hasRole('Lecturer')"/>
			<acme:menu-suboption code="master.menu.authenticated.company.update" action="/authenticated/company/update" access="hasRole('Company')"/>
			<acme:menu-suboption code="master.menu.authenticated.company.create" action="/authenticated/company/create" access="!hasRole('Company')"/>
			<acme:menu-suboption code="master.menu.authenticated.auditor.create" action="/authenticated/auditor/create" access="!hasRole('Auditor')"/>
			<acme:menu-suboption code="master.menu.authenticated.auditor.update" action="/authenticated/auditor/update" access="hasRole('Auditor')"/>
			<acme:menu-suboption code="master.menu.authenticated.assistant.create" action="/authenticated/assistant/create" access="!hasRole('Assistant')"/>
			<acme:menu-suboption code="master.menu.authenticated.assistant.update" action="/authenticated/assistant/update" access="hasRole('Assistant')"/>
			<acme:menu-suboption code="master.menu.authenticated.student.create" action="/authenticated/student/create" access="!hasRole('Student')"/>
			<acme:menu-suboption code="master.menu.authenticated.student.update" action="/authenticated/student/update" access="hasRole('Student')"/>
			
		</acme:menu-option>

		<acme:menu-option code="master.menu.sign-out" action="/master/sign-out" access="isAuthenticated()"/>
	</acme:menu-right>
</acme:menu-bar>


<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" uri="http://www.the-acme-framework.org/"%>

<h2>
	<acme:message code="auditor.auditorDashboard.form.title.general-indicators"/>
</h2>

<table class="table table-sm">
	<tr>
		<th scope="row">
			<acme:message code="auditor.auditorDashboard.form.label.average-num-auditing-records"/>
		</th>
		<td>
			<acme:print value="${numOfAuditingRecordsStats.getAverage()}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="auditor.auditorDashboard.form.label.max-num-auditing-records"/>
		</th>
		<td>
			<acme:print value="${numOfAuditingRecordsStats.getMax()}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="auditor.auditorDashboard.form.label.min-num-auditing-records"/>
		</th>
		<td>
			<acme:print value="${numOfAuditingRecordsStats.getMin()}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="auditor.auditorDashboard.form.label.lin-dev-num-auditing-records"/>
		</th>
		<td>
			<acme:print value="${numOfAuditingRecordsStats.getDev()}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="auditor.auditorDashboard.form.label.average-time-period"/>
		</th>
		<td>
			<acme:print value="${periodOfAuditingRecordStats.getAverage()}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="auditor.auditorDashboard.form.label.max-time-period"/>
		</th>
		<td>
			<acme:print value="${periodOfAuditingRecordStats.getMax()}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="auditor.auditorDashboard.form.label.min-time-period"/>
		</th>
		<td>
			<acme:print value="${periodOfAuditingRecordStats.getMin()}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="auditor.auditorDashboard.form.label.lin-dev-time-period"/>
		</th>
		<td>
			<acme:print value="${periodOfAuditingRecordStats.getDev()}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="auditor.auditorDashboard.form.label.hands-on-audits"/>
		</th>
		<td>
			<acme:print value="${numberOfHandsOnAudits}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="auditor.auditorDashboard.form.label.theoretical-audits"/>
		</th>
		<td>
			<acme:print value="${numberOfTheoreticalAudits}"/>
		</td>
	</tr>
	<tr>
		<th scope="row">
			<acme:message code="auditor.auditorDashboard.form.label.balanced-audits"/>
		</th>
		<td>
			<acme:print value="${numberOfBalancedAudits}"/>
		</td>
	</tr>	
</table>
 
<jstl:choose>
<jstl:when test="${numberOfHandsOnAudits>0.0 || numberOfTheoreticalAudits>0.0 || numberOfBalancedAudits>0.0 }">
<h2>
	<acme:message code="auditor.auditorDashboard.form.title.nature-audits"/>
</h2>

<div>
	<canvas id="canvas"></canvas>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		var data = {
			labels : [
					"HANDS-ON", "THEORETICAL", "BALANCED"
			],
			datasets : [
				{
					data : [
						<jstl:out value="${numberOfHandsOnAudits}"/>, 
						<jstl:out value="${numberOfTheoreticalAudits}"/>, 
						<jstl:out value="${numberOfBalancedAudits}"/>,
					],
					backgroundColor: [
					      'rgb(250, 235, 215)',
					      'rgb(127, 255, 212)',
					      'rgb(0, 255, 255)',				    ]
				}
			]
		};
		var options = {
			scales : {
				yAxes : [
					{
						ticks : {
							suggestedMin : 0.0,
							suggestedMax : 100.0
						}
					}
				]
			},
			legend : {
				display : false
			}
		};
	
		var canvas, context;
	
		canvas = document.getElementById("canvas");
		context = canvas.getContext("2d");
		new Chart(context, {
			type : "bar",
			data : data,
			options : options
		});
	});
</script>
</jstl:when>
</jstl:choose>
<jstl:choose>
<jstl:when test="${numOfAuditingRecordsStats.getMax()>0.0}">

	<h2><acme:message code="auditor.auditorDashboard.form.label.num-audits.information"/></h2>
	<div>
		<canvas id="canvas2"></canvas>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			var data = {
				labels : [
						"AVERAGE", "MAX", "MIN","STANDARD DEVIATION"
				],
				datasets : [
					{
						data : [
							<jstl:out value="${numOfAuditingRecordsStats.getAverage()}"/>, 
							<jstl:out value="${numOfAuditingRecordsStats.getMax()}"/>, 
							<jstl:out value="${numOfAuditingRecordsStats.getMin()}"/>,
							<jstl:out value="${numOfAuditingRecordsStats.getDev()}"/>
						],
						backgroundColor: [
							'rgb(250, 235, 215)',
						      'rgb(127, 255, 212)',
						      'rgb(0, 255, 255)',
						      'rgb(230, 170, 243)'
					    ]
					}
				]
			};
			
			
			var options = {
					scales : {
						yAxes : [
							{
								ticks : {
									suggestedMin : 0.0,
									suggestedMax : 100.0
								}
							}
						]
					},
					legend : {
						display : false
					}
				};
			
			var canvas, context;
			canvas = document.getElementById("canvas2");
			context = canvas.getContext("2d");
			new Chart(context, {
				type : "bar",
				data : data,
				options : options
			});
		});
	</script>

</jstl:when>
</jstl:choose>
 
<acme:return/>


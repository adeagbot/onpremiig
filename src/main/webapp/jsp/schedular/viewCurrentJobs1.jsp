<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#run ").click(function(){
		var $row = $(this).closest("tr");
		var $feedId = $row.find('td:eq( 0 )').html();
		var $jobId = $row.find('td:eq( 1 )').html();
		var $batchDate = $row.find('td:eq(2)').html();
		alert($batchDate);

			   $.post('/scheduler/runScheduleJob', {
				   feedId : $feedId,
				   jobId : $jobId,
				   batchDate : $batchDate
				}, function(data) {
					$('#allvalues').html(data)
				});
				window.location.reload();
			});		
	
	$("#stop ").click(function(){
		var $row = $(this).closest("tr");
		var $feedId = $row.find('td:eq( 0 )').html();
		var $jobId = $row.find('td:eq( 1 )').html();
		var $batchDate = $row.find('td:eq(2)').html();
			   $.post('/scheduler/stopScheduleJob', {
				   feedId : $feedId,
				   jobId : $jobId,
				   batchDate : $batchDate
				}, function(data) {
					$('#allvalues').html(data)
				});
				window.location.reload();
			});	
});
</script>

			<div id="allvalues" style="display: block;">
				 <table class="table table-bordered"   >
                    <thead>
                      <tr style="color: green;;font: bolder;">
                      <th>
                          Feed Id
                        </th>
                        <th>
                          Job Id
                        </th>
                        <th>
                          Batch Date
                        </th>
                        <th>
                         Schedule Info
                        </th>
                    	<th>
                          Status
                        </th>
                       <th >
                        Run/Re-Run
                        </th>
                       <th >
                        Kill
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                   <c:forEach var="row" items="${allLoadJobs}">
	                    <tr>
	                    <td><c:out value="${row.batch_id}" /></td>
	                    <td><c:out value="${row.job_id}" /></td>
						<td><c:out value="${row.batch_date}" /></td>
						<td><c:out value="${row.job_schedule_time}" /></td>
						<td>
                        <c:out value="${row.status}" />
                        </td>
						<td>
						<a href="#" ><img name="run" id="run" src="../../assets/img/run.png"  alt="Image" height="160" width="160"class="rounded"></a>
						
						</td>
						<td>
						<a href="#" ><img name="stop" id="stop" src="../../assets/img/stop.png"  alt="Image" height="160" width="160"class="rounded">
						</a>
						</td>	
						</tr>
	                </c:forEach>
                      
                     </tbody>
                  </table>
                 </div>
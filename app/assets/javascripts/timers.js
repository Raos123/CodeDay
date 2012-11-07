$(function(){
	getProjects();
	$('#company').change(getProjects);
});

function getProjects()
{
	$.get('/companies/'+$('#company').val()+'/projects', function(data)
		{
			$('#timer_project_id').find('option').remove()
			for(var i=0; i < data.length; i++)
			{
				var $option = $('<option>').val(data[i][1]).text(data[i][0]);
				$('#timer_project_id').append($option);
			}
		});
}

{include file="header.tpl"}

<div class="container mt-5 mb-5 d-flex justify-content-center">
    <img src="images/left-arrow.svg" class="left-arrow"/>
    <h1>Works</h1>
    <a href="works.php?mode=view"><img src="images/frame.svg" class="frame"/></a>
</div>


<div class="container">
<table class="table table-dark table-hover">
<thead>
    <tr class="table-active">
        <th scope="col">Task</th>
        <th scope="col">Type</th>
        <th scope="col">Часы</th>
        <th scope="col">Status</th>
        <th scope="col">Updated</th>
    </tr>
</thead>
{foreach $works as $task}
    <tr class="table-active">
        <th scope="row"><a class="manage_a text-white" href="works.php?mode=view&task_id={$task.task_id}">{$task.name}</a></td>
        <th scope="row"><a class="manage_a text-white" href="works.php?mode=view&task_id={$task.task_id}">{$task.type}</a></td>
        <th scope="row"><a class="manage_a text-white" href="works.php?mode=view&task_id={$task.task_id}">{$task.time}</a></td>
        <th scope="row">
            {foreach $statuses as $status}
                {if $task.status == $status.code}
                <a class="manage_a text-white" href="works.php?mode=view&task_id={$task.task_id}">{$status.value}</a>
                {/if}
            {/foreach}
        </td>
        <td class="table-active" colspan="2"><a class="text-white" href="works.php?mode=view&task_id={$task.task_id}">{$task.timestamp}</a></td>
    </tr>
{/foreach}
</table>
</div>
{include file="header.tpl"}

<div class="container mt-5 mb-5 d-flex justify-content-center">
<form class="form-inline" action="works.php" method="POST">
    <input type="hidden" name="task_data[task_id]" value="{$task.task_id}" />
    <div class="container d-flex justify-content-center">
        <a href="works.php?mode=manage"><img src="images/left-arrow.svg" class="back-arrow"/></a>
        {if !empty($task.task_id)}
            <h1>Task #{$task.task_id} | {$task.name}</h1>
        {else}
            <h1>New task</h1>
        {/if}
    </div>
    <div class="container">
        <div class="row justify-content-between">
            <label class="form-label" for="select_status">Status</label>
            <select class="form-select" id="select_status" name="task_data[status]">
                {foreach $statuses as $status}
                <option value="{$status.code}" {if $task.status == $status.code}selected{/if}>{$status.value}</option>
                {/foreach}
            </select>
        </div>
    <div class="row justify-content-between">
        <label class="form-label" for="working_time">Time</label>
        <input type="number" id="working_time" class="form-control" name="task_data[time]" value="{$task.time}"/> 
    </div>
    <div class="row justify-content-between">
        <label class="form-label" for="select_type">Type</label>
        <select class="form-select" id="select_type" name="task_data[type]" value="{$task.type}">
            <option value="development">Разработка</option>
            <option value="learn">Изучение</option>
        </select>
    </div>
    <div class="row justify-content-between">
        <label class="form-label" for="task_name">Name</label>
        <input id="task_name" class="form-control" name="task_data[name]" value="{$task.name}"/> 
    </div>
    <div class="row justify-content-between">
        <label class="form-label" for="task_descr">Description</label>
        <textarea class="form-control" id="task_descr" class="task_descr" name="task_data[description]" rows="6">{$task.description}</textarea>
    </div>
    <div class="row justify-content-between">
        <label class="form-label" for="developer">Developer</label>
        <select class="form-select" id="select_developer" name="task_data[developer]">
        {foreach $profiles as $profile}
            <option value="{$profile.user_id}" {if $task.developer == $profile.user_id}selected{/if}>{$profile.userlogin}</option>
        {/foreach}
        </select>
    </div> 
    <div class="row justify-content-between">
        <label class="form-label" for="tester">Tester</label>
        <select class="form-select" id="select_tester" name="task_data[tester]">
        {foreach $profiles as $profile}
            <option value="{$profile.user_id}" {if $task.tester == $profile.user_id}selected{/if}>{$profile.userlogin}</option>
        {/foreach}
        </select>
    </div>
    <div class="row justify-content-between">
        <label class="form-label" for="date_start">Дата начала</label>
        <input type="date" id="date_start" class="form-control" name="task_data[time_start]" value="{$task.time_start}"/> 
    </div>
    <div class="row justify-content-between">
        <label class="form-label" for="date_end">Дата завершения</label>
        <input type="date" id="date_end" class="form-control" name="task_data[time_end]" value="{$task.time_end}"/> 
    </div>
    <div class="row justify-content-between">
        <input class="save_btn" type="submit" value="Save">
    </div>
</form>
</div>


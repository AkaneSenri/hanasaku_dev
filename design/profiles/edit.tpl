{include file="header.tpl"}

<div class="main_content">
    <h1><a href="profile.php?mode=manage"><</a> Profile</h1>
</div>

<form action="profile.php" method="post">
<div class="form_content">
<input type="hidden" name="user_data[user_id]" value="{$user.user_id}" />
    <div class="controls">
        <label class="label" for="userlogin">Логин</label>
        <input id="login" class="input" name="user_data[userlogin]" value="{$user.userlogin}"/>
    </div>
    <div class="controls">
        <label class="label" for="firstname">Имя</label>
        <input id="user_firstname" class="input" name="user_data[firstname]" value="{$user.firstname}"/> 
    </div>
    <div class="controls">
        <label class="label" for="lastname">Фамилия</label>
        <input id="user_lastname" class="input" name="user_data[lastname]" value="{$user.lastname}"/> 
    </div>
    <div class="controls">
        <label class="label" for="post">Должность</label>
        <select class="select" id="post" name="user_data[post]">
            <option value="developer">Разработчик</option>
            <option value="tester">Тестер</option>
            <option value="designer">Дизайнер</option>
        </select>
    </div> 
    <div class="controls">
      <input class="save_btn" type="submit" value="Save">
    </div>
</form>

<h1>Выполненные задачи</h1>
<table>
  <thead class="manage_thead">
    <tr class="manage_tr">
      <th class="manage_th">Задача</th>
      <th class="manage_th">Тип</th>
      <th class="manage_th">Часы</th>
      <th class="manage_th">Выполнено</th>
    </tr>
  </thead>
{foreach $works as $task}
<tr class="manage_tr">
  <td class="manage_td"><a class="manage_a" href="works.php?mode=view&task_id={$task.task_id}">{$task.name}</a></td>
  <td class="manage_td"><a class="manage_a" href="works.php?mode=view&task_id={$task.task_id}">{$task.type}</a></td>
  <td class="manage_td"><a class="manage_a" href="works.php?mode=view&task_id={$task.task_id}">{$task.time}</a></td>
  <td class="manage_td"><a class="manage_a" href="works.php?mode=view&task_id={$task.task_id}">{$task.time_end}</a></td>
</tr>
{/foreach}
</table>

<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Oswald:wght@200&family=Roboto:wght@400;700&display=swap" rel="stylesheet">

{include file="header.tpl"}
<div class="main_content">
    <h1><a href="index.php"><</a> Profile</h1>
    <p><a href="profile.php?mode=edit">Добавить профиль</a></p>
</div> 

<table>
<thead class="manage_thead">
    <tr class="manage_tr">
        <th class="manage_th">Login</th>
        <th class="manage_th">Name</th>
        <th class="manage_th">Last name</th>
        <th class="manage_th">Post</th>
    </tr>
</thead>
{foreach $profiles as $user}
    <tr class="manage_tr">
        <td class="manage_td"><a class="manage_a" href="profile.php?mode=view&user_id={$user.user_id}">{$user.userlogin}</a></td>
        <td class="manage_td"><a class="manage_a" href="profile.php?mode=view&user_id={$user.user_id}">{$user.firstname}</a></td>
        <td class="manage_td"><a class="manage_a" href="profile.php?mode=view&user_id={$user.user_id}">{$user.lastname}</a></td>
        <td class="manage_td"><a class="manage_a" href="profile.php?mode=view&user_id={$user.user_id}">{$user.post}<a><td>
    </tr>
{/foreach}
</table>

<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Oswald:wght@200&family=Roboto:wght@400;700&display=swap" rel="stylesheet">

{include file="header.tpl"}


<form action="settings.php" method="POST">
    <div class="controls">
        <label class="label" for="price_hour">Price per hour</label>
        <input type="number" id="price_hour" class="input" name="settings_data[price]" value="{$settings.price}"/> 
    </div>
    <div class="controls">
        <input class="save_btn" type="submit" value="Save">
    </div>
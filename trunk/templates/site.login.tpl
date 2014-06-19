<h1>{$words_adminpanel_title}</h1>
<div class='form-box' id='login-box'>
    <div class='header'>{$words_adminpanel}</div>
     <form action='' method='post' name='login' id='login'>
        <div class='body bg-gray'>
            <div class='form-group'>
                <input type='text'  id='username' name='username' class='form-control' placeholder='{$words_adminpanel_user}' style='width:100%;'/>						
            </div>
            <div class='form-group'>
                <input type='password' id='password' name='password' class='form-control' placeholder='{$words_adminpanel_pass}' style='width:100%;'/>						
            </div>            
        </div>
        <div class='footer'>                                                               
            <button type='submit' class='btn bg-olive btn-block' name='submit' id='submit'>{$words_adminpanel_btn}</button> 							
            <a href="/" class="public-site">{$words_adminpanel_link}</a>
         </div>
    </form>
</div> 
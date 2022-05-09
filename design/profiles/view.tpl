<body>
  <div class="container bootstrap snippets bootdeys">
      <div class="row" id="user-profile">
          <div class="col-lg-3 col-md-4 col-sm-4">
              <div class="main-box clearfix">
                  <h2>{$user.userlogin}</h2>
                  <div class="profile-status">
                      <i class="fa fa-check-circle"></i> Online
                  </div>
                  <img src="https://okeygeek.ru/wp-content/uploads/2020/03/no_avatar.png" alt="" class="profile-img img-responsive center-block" width="240">
                  <div class="profile-label">
                      <span class="label label-danger">{$user.post}</span>
                  </div>

                  <div class="profile-details">
                      <ul class="fa-ul">
                          <li><i class="fa-li fa fa-tasks"></i>Tasks done: <span>{$works|count}</span></li>
                          <li><i class="fa-li fa fa-comment"></i>Tested: <span>{$tested|count}</span></li>
                          <li><i class="fa-li fa fa-clock-o"></i>Hours completed: <span>{$result.0}</span></li>
                          <li><i class="fa-li fa fa-money"></i>Earned money: <span>{$paycheck}</span></li>
                      </ul>
                      
                  </div>

                  <div class="profile-message-btn center-block text-center">
                      <a href="mailto:{$user.email}" class="btn btn-success">
                          <i class="fa fa-envelope"></i> Send message
                      </a>
                  </div>
              </div>
          </div>

          <div class="col-lg-9 col-md-8 col-sm-8">
              <div class="main-box clearfix">
                  <div class="profile-header">
                      <h3><span>User info</span></h3>
                      <a href="profile.php?mode=edit&user_id={$user.user_id}" class="btn btn-primary edit-profile">
                          <i class="fa fa-pencil-square fa-lg"></i> Edit profile
                      </a>
                  </div>

                  <div class="row profile-user-info">
                      <div class="col-sm-8">
                          <div class="profile-user-details clearfix">
                              <div class="profile-user-details-label">
                                  First Name
                              </div>
                              <div class="profile-user-details-value">
                                  {$user.firstname}
                              </div>
                          </div>
                          <div class="profile-user-details clearfix">
                              <div class="profile-user-details-label">
                                  Last Name
                              </div>
                              <div class="profile-user-details-value">
                                  {$user.lastname}
                              </div>
                          </div>
                          <div class="profile-user-details clearfix">
                              <div class="profile-user-details-label">
                                  Email
                              </div>
                              <div class="profile-user-details-value">
                                  {$user.email}
                              </div>
                          </div>
                          <div class="profile-user-details clearfix">
                              <div class="profile-user-details-label">
                                  Description
                              </div>
                              <div class="profile-user-details-value">
                                  {$user.description}
                              </div>
                          </div>
                      </div>
                      <div class="col-sm-4 profile-social">
                          <ul class="fa-ul">
                              <li><i class="fa-li fa fa-twitter-square"></i><a href="#">@{$user.userlogin}</a></li>
                              <li><i class="fa-li fa fa-facebook-square"></i><a href="#">{$user.userlogin}</a></li>
                              <li><i class="fa-li fa fa-skype"></i><a href="#">{$user.userlogin}</a></li>
                              <li><i class="fa-li fa fa-instagram"></i><a href="#">{$user.userlogin}</a></li>
                          </ul>
                      </div>
                  </div>

                  <div class="tabs-wrapper profile-tabs">
                      <ul class="nav nav-tabs">
                      </ul>
                      <div class="tab-content">
                      {if !empty($works) || !empty($tested)}
                          <div class="table-responsive">
                              <table class="table">
                                  <tbody>
                                    {foreach $works as $task}
                                      <tr>
                                          <td class="text-center">
                                              <i class="fa fa-check"></i>
                                          </td>
                                          <td>
                                              {$user.firstname} 
                                                {if $task.status == 'N'} got a new task 
                                                {elseif $task.status == 'W'} started developing 
                                                {elseif $task.status == 'C'} completed task 
                                                {elseif $task.status == 'S'} canceled the task
                                                {/if}<a href="works.php?mode=view&task_id={$task.task_id}">{$task.name}</a>.
                                          </td>
                                          <td>
                                              {$task.timestamp}
                                          </td>
                                      </tr>
                                    {/foreach}
                                    {foreach $tested as $test}
                                      <tr>
                                          <td class="text-center">
                                              <i class="fa fa-users"></i>
                                          </td>
                                          <td>
                                              {$user.firstname} tested <a href="works.php?mode=view&task_id={$test.task_id}">{$test.name}</a>.
                                          </td>
                                          <td>
                                              {$task.timestamp}
                                          </td>
                                      </tr>
                                    {/foreach}
                                    {if $user.user_id == 1 || $user.user_id == 2}
                                      <tr>
                                        <td class="text-center">
                                            <i class="fa fa-check"></i>
                                        </td>
                                        <td>
                                            {$user.firstname} create helpdesk</a>.
                                        </td>
                                        <td>
                                            2022-02-25 15:33:00
                                        </td>
                                    </tr>
                                    {/if}
                                  </tbody>
                              </table>
                          </div>
                      {/if}
                    </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

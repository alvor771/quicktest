<?php echo $header ?>

<div class="card m-t-0" style="position: relative !important;">
	<div class="top-open">
		<i class="fa fa-plus"></i>
	</div>
	<div class="container">
		<div class="col-md-1 box pull-left q-logo hidden-sm hidden-xs">Q</div>
		<div class="col-lg-11 col-md-11 col-sm-12 col-xs-12 box p-b-0 pull-right">
			<h3>Registration<?php // echo $questions[1][0]->topic_name ?></h3>
			<p class="description"><?php // echo $questions[1][0]->topic_description ?></p>
		</div>
	</div>
</div>

<!-- CONTENT SECTION -->
<section class="p-a-md bg-light-grey content-dashboard content-align-md">

	<div class="col-lg-8">

		<form id="form" method="post">
			<div class="box card m-t-0" style="overflow: hidden;">
				<div class="card-block question">

					<div class="question_data">
						<h5 class="question-title">Sign Up</h5>
						<div class="col-md-6 col-md-offset-3 answer">
							<div class="form-group">
								<input type="text" name="up[firstname]" id="firstname" class="form-control"
									   placeholder="Firstname">
							</div>
							<div class="form-group">
								<input type="text" name="up[lastname]" id="lastname" class="form-control" placeholder="Lastname">
							</div>
							<div class="form-group">
								<input type="password" name="up[password]" id="password" class="form-control" placeholder="Password">
							</div>
							<div class="form-group">
								<input type="password" name="up[password_r]" id="password_r" class="form-control"
									   placeholder="Repeat password">
							</div>
							<div class="form-group">
								<input type="email" name="up[email]" id="password_r" class="form-control" placeholder="Repeat password">
							</div>
							<div class="form-group">
								<input type="file" name="up[photo]" id="photo" class="form-control" placeholder="Choose photo">
							</div>

						</div>
					</div>

				</div>
			</div>
			<input type="submit" class="btn btn-md btn-green pull-right" value="Отправить"/>
		</form>

	</div>

	<div class="col-lg-4">
		<div class="box card m-t-0">
			<div class="top-open"></div>
			<div class="card-block center">
				<h5 class="card-title">Отсавшееся время</h5>
				<span id="my_timer" style="color: #4cae4c; font-size: 150%; font-weight: bold;">00:19:59</span>
			</div>
		</div>
	</div>


	<div class="col-lg-4">
		<div class="box card m-t-0">
			<div class="top-open"></div>
			<div class="card-block center">
				<h5 class="card-title">Завершенные тесты</h5>
				<p class="card-subtitle"><span id="usageCount">239</span> за неделю</p>
				<div style="width: 100%; height: 150px;" id="lineChart2"></div>
			</div>
		</div>
	</div>

	<div class="col-lg-4">
		<div class="box card m-t-0">
			<div class="top-open"></div>
			<ul class="list-group list-group-fit" id="historyList" style="overflow: hidden; height: inherit;">
				<li class="list-group-item">
					<div class="media">
						<div class="media-left media-middle">
							<i class="material-icons md-36 text-muted">done</i>
						</div>
						<div class="media-body">
							<p class="m-a-0">
								<a href="#">Alexander Voronin</a> завершил тест <a href="#">PHP Easy test</a>
							</p>
							<small class="text-muted">
								<span class="label label-success">Успешно</span>

								<i class="material-icons md-18">timer</i> <span
										class="icon-text"> несколько секунд назад</span>
							</small>
						</div>
					</div>
				</li>
				<li class="list-group-item">
					<div class="media">
						<div class="media-left media-middle">
							<i class="material-icons md-36 text-muted">done</i>
						</div>
						<div class="media-body">
							<p class="m-a-0">
								<a href="#">Dariia Sadik</a> завершила тест <a href="#">Java FX</a>
							</p>
							<small class="text-muted">
								<span class="label label-success">Успешно</span>

								<i class="material-icons md-18">timer</i>
								<span class="icon-text"> 2 минуты назад</span>
							</small>
						</div>
					</div>
				</li>
				<li class="list-group-item">
					<div class="media">
						<div class="media-left media-middle">
							<i class="material-icons md-36 text-muted">warning</i>
						</div>
						<div class="media-body">
							<p class="m-a-0">
								<a href="#">Darek Karwatka</a> завершил тест <a href="#">MySQL для новичков</a>
							</p>
							<small class="text-muted">
								<span class="label label-danger">Не правильно</span>

								<i class="material-icons md-18">timer</i>
								<span class="icon-text">12 часов назад</span>
							</small>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

</section>


<script type="text/javascript">
    startTimer();
    function startTimer() {
        var my_timer = document.getElementById("my_timer");
        var time = my_timer.innerHTML;
        var arr = time.split(":");
        var h = arr[0];
        var m = arr[1];
        var s = arr[2];
        if (s == 0) {
            if (m == 0) {
                if (h == 0) {

                    my_timer.innerHTML = "<div style='color: red;'>Время вышло!</div>";
                    //alert("Время вышло");
//                    window.location.reload();
                    return;
                }
                h--;
                m = 60;
                if (h < 10) h = "0" + h;
            }
            m--;
            if (m < 10) m = "0" + m;
            s = 59;
        }
        else s--;
        if (s < 10) s = "0" + s;
        document.getElementById("my_timer").innerHTML = h + ":" + m + ":" + s;
        setTimeout(startTimer, 1000);
    }
</script>

</body>
</html>


<?php echo $footer ?>
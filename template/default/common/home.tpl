<?php echo $header ?>

<div class="card m-t-0" style="position: relative !important;">
	<div class="top-open">
		<i class="fa fa-plus"></i>
	</div>
	<div class="container">
		<div class="col-md-1 box pull-left q-logo hidden-sm hidden-xs">Q</div>
		<div class="col-lg-11 col-md-11 col-sm-12 col-xs-12 box p-b-0 pull-right">
			<h3><?php echo $questions[1][0]->topic_name ?></h3>
			<p class="description"><?php echo $questions[1][0]->topic_description ?></p>
		</div>
	</div>
</div>

<!-- CONTENT SECTION -->
<section class="p-a-md bg-light-grey content-dashboard content-align-md">

	<div class="col-lg-8">

		<?php if (isset($_POST['q'])): ?>
		<div class="card">
			<pre><?php var_dump($_POST['q']); ?></pre>
		</div>
		<?php endif; ?>

		<form id="form" method="post">
			<?php foreach($questions as $id => $question): ?>
			<div class="box card m-t-0" style="overflow: hidden;">
						<div class="card-block question">

							<div class="question_data">
								<h5 class="question-title"><?php echo $question[0]->question_title; ?></h5>

								<?php foreach($question as $answer): ?>
								<div class="col-md-12 answer">
									<?php if ($question[0]->question_type == 'radio'): ?>
									<input type="<?php echo $question[0]->question_type ?>"
										   value="[<?php echo $answer->id ?>]"
										   class="<?php echo $question[0]->question_type ?>"
										   id="a[<?php echo $answer->id ?>]"
										   name="q[<?php echo $question[0]->question_id; ?>]"/>
									<?php elseif ($question[0]->question_type == 'checkbox'): ?>
									<input type="<?php echo $question[0]->question_type ?>"
										   value="[<?php echo $answer->id ?>]"
										   class="<?php echo $question[0]->question_type ?>"
										   id="a[<?php echo $answer->id ?>]"
										   name="q[<?php echo $question[0]->question_id; ?>][<?php echo $answer->id ?>]"/>
									<?php endif; ?>
									<label for="a[<?php echo $answer->id ?>]"><?php echo $answer->answer_text ?></label>
								</div>
								<?php endforeach; ?>

							</div>
				</div>
			</div>

			<?php endforeach; ?>
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
<?php echo $header ?>

<!--
<div class="topbar">
	<div class="container">
		<div class="pull-left">
			<img src="template/default/images/logo5.png" class="logo">
		</div>
		<div class="pull-right">
			<button class="btn upanel_btn ion-water_droplet_2">
					 <span class="user_ava">
						<img src="http://art-ucoz.ru/template/images/no_avatar.jpg" alt="Гость">
					 </span>
				<span class="uName hidden-xs hidden-sm">Гость</span>
				<i class="fa fa-caret-down"></i>
			</button>
		</div>
	</div>
</div>
-->

<div class="page-header">
	<div class="container">
		<h4><?php echo $questions[1][0]->topic_name ?></h4>
		<p><?php echo $questions[1][0]->topic_description ?></p>
	</div>
</div>


<div class="main-area">
	<div class="container">

		<form method="post">
		<?php foreach($questions as $id => $question): ?>

		<div class="question">
			<div class="question_num">
				<div class="our_services_num circle">
				 <span class="services_num circle">
					 <span class="radius_num circle">
						 <span><?php echo $id; ?></span>
					 </span>
				 </span>
				</div>
			</div>

			<div class="question_data">
				<h4><?php echo $question[0]->question_title; ?></h4>

				<?php foreach($question as $answer): ?>
				<div class="col-md-12">
					<?php if ($question[0]->question_type == 'radio'): ?>
					<input type="<?php echo $question[0]->question_type ?>" value="[<?php echo $answer->id ?>]" class="<?php echo $question[0]->question_type ?>" id="a[<?php echo $answer->id ?>]" name="q[<?php echo $question[0]->question_id; ?>]"/>
					<?php elseif ($question[0]->question_type == 'checkbox'): ?>
					<input type="<?php echo $question[0]->question_type ?>" value="[<?php echo $answer->id ?>]" class="<?php echo $question[0]->question_type ?>" id="a[<?php echo $answer->id ?>]" name="q[<?php echo $question[0]->question_id; ?>][<?php echo $answer->id ?>]"/>
					<?php endif; ?>
					<label for="a[<?php echo $answer->id ?>]"><?php echo $answer->answer_text ?></label>
				</div>
				<?php endforeach; ?>

			</div>
		</div>

		<?php endforeach; ?>
				<input type="submit" class="btn btn-blue" value="Отправить"/>
		</form>

	</div>

	<?php echo $footer ?>
<?php

class ControllerIndex extends Controller
{
    public function index()
    {
        $this->template = 'default/common/home.tpl';

        $this->children = array(
            'common/header',
            'common/footer',
        );

        $this->load->model('common/home');

        $questionAnswers = array();
        $questions = $this->ModelCommonHome->getQuestions(1);


		$this->document->setTitle('My title');

        foreach ($questions as $question) {
            $id = $question->tq_id;
            $questionAnswers[$id][] = $question;
        }

        $this->data['questions'] = $questionAnswers;

        if (isset($this->rq->post['q'])) {
            $answers = $this->rq->post['q'];
            $this->data['answers'] = $answers;
        }

        $this->rp->setOutput($this->render());
    }

    public function page()
    {


        $this->children = array(
            'common/header',
            'common/footer',
        );

        $this->data['message'] = "Hello world";

        $this->template = 'default/common/maintanance.tpl';

        $this->rp->setOutput($this->render());
    }

}
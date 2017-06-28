<?php

class ControllerTestout extends Controller
{
    public function index()
    {
//        $this->template = 'default/common/testout.tpl';
        $this->template = 'default/common/home.tpl';

        $this->children = array(
            'common/header',
            'common/footer',
        );

        $this->load->model('common/home');

        $questionAnswers = array();
        $questions = $this->ModelCommonHome->getQuestions(1);

        foreach ($questions as $question) {
            $id = $question->tq_id;
            $questionAnswers[$id][] = $question;
        }

        $this->data['questions'] = $questionAnswers;

        if (isset($this->request->post['q'])) {
            $answers = $this->request->post['q'];

//            print_r($answers);
            $this->data['answers'] = $answers;
        }

        $this->response->setOutput($this->render());
    }

    public function page()
    {


        $this->children = array(
            'common/header',
            'common/footer',
        );

        $this->data['message'] = "Hello world";

        $this->template = 'default/common/maintanance.tpl';

        $this->response->setOutput($this->render());
    }

    public function r_menu(Array $array)
    {
        foreach ($array as $item) {
            print_r($item);
            if (isset($item['title'])) {
                echo "<li>" . $item['title'] . "</li>";
            }
            if (isset($item['childs'])) {
                echo "<ul>";

                $this->r_menu($item['childs']);
                echo "</ul>";

            }

        }
    }
}
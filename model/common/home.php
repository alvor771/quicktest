<?php

class ModelCommonHome extends Model
{

	/**
	 * @function getQuestions
	 * @param $id Integer
	 * @return Array
	 */
	public function getQuestions($id) {

		return $this->sql->select('*, tt.id AS tt_id, tq.id AS tq_id, qa.id AS qa_id')
			->from('test_topics AS tt')
			->leftJoin('topic_questions AS tq', 'tt.id = tq.test_id')
			->leftJoin('question_answers AS qa', 'tq.id = qa.question_id')
			->where('tq.enabled = 1 AND tt.id = ' . $id)
			->assoc();

	}

    public function getAnswers(Array $ids) {

        return $this->sql->select('*, tt.id AS tt_id, tq.id AS tq_id, qa.id AS qa_id')
            ->from('test_topics AS tt')
            ->leftJoin('topic_questions AS tq', 'tt.id = tq.test_id')
            ->leftJoin('question_answers AS qa', 'tq.id = qa.question_id')
            ->where('tq.enabled = 1 AND tt.id = ' . $ids)
            ->assoc();

    }

}
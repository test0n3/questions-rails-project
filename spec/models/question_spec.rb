# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'positive cases' do
    it 'creates a question' do
      Question.create(
        content: 'Who are you?',
        description: 'Describe what have you been doing, thinking, planing today.'
      )
      expect(Question.count).to eq(1)
    end

    it 'deletes a question' do
      question = Question.create(content: 'example')
      question.destroy
      expect(Question.count).to eq(0)
    end
  end

  context 'negative cases' do
    it 'fails if question has no content' do
      question = Question.create(content: '', description: 'some empty questions')
      expect(question.errors.messages[:content]).to include("can't be blank")
    end

    it 'fails if content is smaller than 3 chars' do
      question = Question.create(content: 'wh')
      expect(question.errors.messages[:content]).to include('is too short (minimum is 3 characters)')
    end
  end
end

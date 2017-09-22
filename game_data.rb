require_relative 'colorable'

class GameData 
	include Colorable

	def article_questions
		[{question: colorize(str: "What's the article of Bier?", color_code: 36), answer: 'Das Bier'},
		{question: colorize(str: "What's the article of Buch?", color_code: 36), answer: 'Das Buch'}]
		# {question: colorize(str: "What's the article of Frau?", color_code: 36), answer: 'Die Frau'},
		# {question: colorize(str: "What's the article of Wasser?", color_code: 36), answer: 'Das Wasser'}]
	end

	def plural_questions
		[{question: colorize(str: "What's the plural of Der Man?", color_code: 34), answer: 'Die Männer'},
		{question: colorize(str: "What's the plural of Das Buch?", color_code: 34), answer: 'Die Bücher'},
		{question: colorize(str: "What's the plural of Die Frau?", color_code: 34), answer: 'Die Frauen'},
		{question:  colorize(str: "What's the plural of Der Computer?", color_code: 34), answer: 'Die Computer'}]
	end

	def word_questions
		[{question: colorize(str: 'How do you say man?', color_code: 35), answer: 'Der Man'},
		{question: colorize(str: 'How do you say woman?', color_code: 35), answer: 'Die Frau'},
		{question: colorize(str: 'How do you say water?', color_code: 35), answer: 'Das Wasser'},
		{question: colorize(str: 'How do you say computer?', color_code: 35), answer: 'Der Computer'}]
	end

end
const String question = 'question';
const String options = 'options';
const String rightAnswer = 'rightAnswer';
const String givenAnswer = 'givenAnswer';
final List<Map<String, dynamic>> questionList = [  
  {
    question: 'Which of the following is not a build in type in Dart?',
    options: ['int', 'float', 'bool', 'Function'], 
    rightAnswer: 'float',
    givenAnswer: ''
  },   
  {
    question: 'Which one is false?',
    options: ['Abstract method doesnot have  a body', 'Abstract classes cannot be instantiated', 'A class can have multiple constructors', 'A class canot implement another class and can be mixed with another class at the same time'],
    rightAnswer: 'A class cannot implement another class and can be mixed wirth another class at the same time',
    givenAnswer: ''     
  },
  {
    question: 'True/False: Positional arguments acnnot have a defult value',
    options: ['True', 'False',],
    rightAnswer: 'True',
    givenAnswer: ''
  },
  {
    question: 'The __________function is a predefined method in Dart',
    options: ['declare', 'List', 'main', 'return'],
    rightAnswer: 'main',
    givenAnswer: '',
  },
  {
    question: 'SDK stands for _______',
    options: ['System Dart Kernel','Software Development Kernel', 'Software Development Kit', 'Software Design Key'],
    rightAnswer: 'Software Development Design Kit',
    givenAnswer: ''
  },
];

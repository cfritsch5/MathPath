export const addingproblem = function() {
  let a = randDig();
  let b = randDig();
  let ans = a + b;
  let prob = `${a} + ${b}`;
  return {problem: prob, answer: ans};
};

const randDig = function(){
  Math.floor(Math.random()*10);
};

// ------------

class Mult {
  constructor(...factors){
    this.factors = factors;
  }
}

class Term {
  constructor(sign = "positive", ...terms){
    this.sign =
    this.terms = terms;
  }
}

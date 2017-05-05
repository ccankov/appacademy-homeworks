import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      num1: '',
      num2: '',
      result: 0
    };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.doMath = this.doMath.bind(this);
    this.clearInput = this.clearInput.bind(this);
  }

  setNum1(e) {
    e.preventDefault();
    this.setState({ num1: e.currentTarget.value });
  }

  setNum2(e) {
    e.preventDefault();
    this.setState({ num2: e.currentTarget.value });
  }

  doMath(e) {
    e.preventDefault();
    let operator = e.currentTarget.innerText;
    let { num1: n1, num2: n2 } = this.state;
    switch (operator) {
      case "+":
        this.setState({ result: parseInt(n1) + parseInt(n2) });
        break;
      case "-":
        this.setState({ result: parseInt(n1) - parseInt(n2) });
        break;
      case "*":
        this.setState({ result: parseInt(n1) * parseInt(n2) });
        break;
      case "/":
        this.setState({ result: parseInt(n1) / parseInt(n2) });
        break;
    }
  }

  clearInput() {
    this.setState({ num1: '', num2: '' });
  }

  render() {
    let { num1: n1, num2: n2 } = this.state;
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input type='text' onChange={this.setNum1} value={n1}></input>
        <input type='text' onChange={this.setNum2} value={n2}></input>
        <br />
        <button onClick={this.doMath}>+</button>
        <button onClick={this.doMath}>-</button>
        <button onClick={this.doMath}>*</button>
        <button onClick={this.doMath}>/</button>
        <button onClick={this.clearInput}>C</button>
      </div>
    );
  }
}

export default Calculator;

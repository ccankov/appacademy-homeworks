import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);

    this.initialState = this.initialState.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleClick = this.handleClick.bind(this);

    this.state = this.initialState();
  }

  initialState() {
    return { searchTerm: '' };
  }

  handleChange(e) {
    this.setState({ searchTerm: e.currentTarget.value });
  }

  handleClick(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
    this.setState(this.initialState());
  }

  render() {
    return (
      <div>
        <form>
          <input type='text'
                 className='search-bar'
                 onChange={this.handleChange}
                 value={this.state.searchTerm}></input>
          <button onClick={this.handleClick}>Search Giphys</button>
        </form>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }
}

export default GiphysSearch;

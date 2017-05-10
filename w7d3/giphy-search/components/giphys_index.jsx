import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({ giphys }) => {
  let giphyLis = '';
  if (giphys.data) {
    giphyLis = giphys.data.map((giphy, idx) => (
      <li key={idx} className="giphy-li"><GiphysIndexItem giphy={giphy}/></li>
    ));
  }
  return (
    <ul>
      { giphyLis }
    </ul>
  );
};

export default GiphysIndex;

import React from 'react';

const GiphysIndexItem = ({ giphy }) => (
  <img src={giphy.images.original.url} width='400px'></img>
);

export default GiphysIndexItem;

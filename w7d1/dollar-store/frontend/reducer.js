const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, { type, baseCurrency, rates}) => {
  switch (type) {
    case 'SWITCH_CURRENCY':
      return {
        baseCurrency,
        rates
      };
    default:
      return state;
  }
};

export default reducer;

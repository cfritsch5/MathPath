import * as UnitsUtil from '../util/units_util';
// import { receiveErrors, clearErrors } from './error_actions';

export const receiveUnits = units => ({
  type: "RECEIVE_UNITS",
  units
});

export const receiveUnit = units => ({
  type: "RECEIVE_UNIT",
  units
});

export const fetchUnits = () => dispatch => (
  UnitsUtil.fetchUnits().then(units => dispatch(receiveUnits(units)))
);

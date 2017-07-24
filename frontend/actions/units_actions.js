import * as UnitsUtil from '../util/units_util';
// import { receiveErrors, clearErrors } from './error_actions';

export const receiveUnits = units => ({
  type: "RECEIVE_UNITS",
  units
});

export const receiveUnit = unit => ({
  type: "RECEIVE_UNIT",
  unit
});

export const fetchUnits = () => dispatch => (
  UnitsUtil.fetchUnits().then(units => dispatch(receiveUnits(units)))
);

export const fetchUnit = (id) => dispatch => (
  UnitsUtil.fetchUnit(id).then(unit => dispatch(receiveUnit(unit)))
);

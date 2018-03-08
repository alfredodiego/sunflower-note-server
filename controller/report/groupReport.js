/**
 * Created by liushupeng on 2018/3/7.
 */
const dbQuery = require('../../lib/mysql');
const getMonday = require('../../common/utils/getMonday');

/**
 * 获取当前用户所在小组的本周周报
 * @param ctx
 * @param next
 * @returns {Promise.<void>}
 */
let getGroupCurrentWeekPort = async (ctx, next) =>  {
  try {
    // const selectSql = 'SELECT groupId FROM user_info WHERE email = ?';
    // let selectGroupId = await dbQuery(selectSql, ctx.session.userId);
    const selectReportSql = "SELECT * FROM report_info WHERE status = 'public' AND groupId = (SELECT groupId,name FROM user_info WHERE email = ?) AND week = ?";
    let groupCurrentReport = await dbQuery(selectReportSql, [ctx.session.userId, getMonday()]);
    if (groupCurrentReport instanceof Array) {
      ctx.body = {
        status: true,
        data: groupCurrentReport
      }
    } else {
      ctx.body = {
        status: false,
        data: '数据获取失败，请重试！'
      }
    }
  } catch(err) {
    console.log(`${ctx.method} - ${ctx.url} ERROR -- ${err}`);
    ctx.body = {
      status: false,
      data: '数据获取失败，请重试！'
    }
  }
};


/**
 * 获取当前用户所在小组的历史周报
 * @param ctx
 * @param next
 * @returns {Promise.<void>}
 */
let getGroupHistoryWeekPort = async (ctx, next) =>  {
  try {
    const selectReportSql = "SELECT * FROM report_info WHERE status = 'public' AND groupId = (SELECT groupId,name FROM user_info WHERE email = ?) AND week != ?";
    let groupHistoryReport = await dbQuery(selectReportSql, [ctx.session.userId, getMonday()]);
    if (groupHistoryReport instanceof Array) {
      ctx.body = {
        status: true,
        data: groupHistoryReport
      }
    } else {
      ctx.body = {
        status: false,
        data: '数据获取失败，请重试！'
      }
    }
  } catch(err) {
    console.log(`${ctx.method} - ${ctx.url} ERROR -- ${err}`);
    ctx.body = {
      status: false,
      data: '数据获取失败，请重试！'
    }
  }
};

module.exports = {
  getGroupCurrentWeekPort,
  getGroupHistoryWeekPort
}
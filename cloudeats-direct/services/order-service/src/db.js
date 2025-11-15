// Placeholder for DB connection (Aurora/Postgres)
module.exports = {
  query: async (sql, params) => {
    console.log("Query executed:", sql, params);
    return [];
  }
};

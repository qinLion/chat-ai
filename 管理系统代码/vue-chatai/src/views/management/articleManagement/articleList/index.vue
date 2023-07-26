<template>
  <div class="article-list">
    <div class="search">
      <div class="select-search">
        <el-input
          placeholder="请输入标题关键词"
          suffix-icon="el-icon-search"
          v-model="title"
        >
        </el-input>
        <el-button type="primary" class="query-btn" @click="handleQueryClick">查询</el-button>
      </div>
      <el-button type="primary" @click="handleAddClick">新建文章</el-button>
    </div>
    <div class="table">
      <el-table
        :data="tableData"
        style="width: 100%"
      >
        <el-table-column
          label="序号"
          type="index"
          width="50"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="title"
          label="标题"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="createTimeString"
          label="发布时间"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="readCount"
          label="阅读量"
          align="center"
        >
        </el-table-column>
        <el-table-column
          fixed="right"
          label="操作"
          align="center"
          width="180">
          <template slot-scope="scope">
            <el-button @click="handleEditClick(scope.row)" type="text" size="small">详情</el-button>
            <el-button @click="handleDeleteClick(scope.row)" type="text" size="small">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="footer">
      <el-pagination
        background
        layout="total, sizes, prev, pager, next"
        :current-page="pageNum"
        :page-sizes="[10, 20, 30, 40]"
        :page-size="pageSize"
        :total="total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      >
      </el-pagination>
    </div>
    <add-article @close="handleCloseClick" class="article-container" v-if="showAddArticle" :title="articleTitle" :id="id"></add-article>
  </div>
</template>
<script>
import addArticle from "@/views/management/articleManagement/addArticle";
import {articleList,articleDelete} from "@/api/management";

export default {
  components: {
    addArticle
  },

  data() {
    return {
      title: '',
      tableData: [],
      pageNum: 1,
      pageSize: 10,
      total: 0,
      showAddArticle: false,
      articleTitle: "",
      id: ""
    }
  },
  created() {
    this.queryArticleList()
  },
  methods: {
    handleQueryClick() {
      this.queryArticleList()
    },
    async queryArticleList() {
      const params = {
        pageNum: this.pageNum,
        pageSize: this.pageSize,
        title: this.title
      }
      const res = await articleList(params)
      if(res.code===200) {
        this.tableData = res.rows
        this.total = res.total
      }
    },
    // 新增
    handleAddClick() {
      this.articleTitle = "新增文章"
      this.showAddArticle = true
    },
    handleCloseClick() {
      this.showAddArticle = false
      this.id = ""
      this.queryArticleList()
    },
    // 编辑
    handleEditClick(row) {
      this.articleTitle = "编辑文章"
      this.showAddArticle = true
      this.id = row.id
    },
    // 删除
    async handleDeleteClick(row) {
      const params = {
        id: row.id
      }
      const res = await articleDelete(params)
      if(res.code===200) {
        this.$message('删除成功')
        this.queryArticleList()
      }
    },
    handleSizeChange(val) {
      this.pageSize = val
      this.queryArticleList()
    },
    handleCurrentChange(val) {
      this.pageNum = val
      this.queryArticleList()
    }
  }
}
</script>
<style lang="scss" scoped>
.article-list {
  height: 100%;
  margin: 20px;

  .search {
    display: flex;
    justify-content: space-between;
    align-items: center;
    .select-search {
      display: flex;
      justify-content: space-between;
      align-items: center;
      .query-btn {
        margin-left: 10px;
      }
    }
  }

  .table {
    margin: 20px 0;
  }
  .article-container {
    position: absolute;
    background-color: #ffffff;
    z-index: 99;
    top: 0px;
    bottom: 0px;
    left: 0px;
    right: 0px;
    overflow-y: auto;
  }
}
</style>



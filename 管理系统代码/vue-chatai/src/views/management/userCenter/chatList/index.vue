<template>
  <div class="chat-list">
    <div class="search">
      <div class="select-search">
        <el-input
          placeholder="请输入用户昵称/手机号"
          suffix-icon="el-icon-search"
          v-model="name">
        </el-input>
        <el-input
          class="chat-word"
          placeholder="请输入聊天关键词"
          suffix-icon="el-icon-search"
          v-model="content">
        </el-input>
      </div>
      <el-button type="primary" @click="handleQueryClick">查询</el-button>
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
          prop="nickname"
          label="昵称"
          align="center"
          width="180px"
        >
        </el-table-column>
        <el-table-column
          prop="phone"
          label="手机号"
          align="center"
          width="180px"
        >
        </el-table-column>
        <el-table-column
          prop="content"
          label="问题"
          align="center"
          show-overflow-tooltip
        >
        </el-table-column>
        <el-table-column
          prop="createTimeString"
          label="发布时间"
          align="center"
        >
        </el-table-column>
        <el-table-column
          fixed="right"
          label="操作"
          width="100">
          <template slot-scope="scope">
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
  </div>
</template>
<script>
import {messageList,messageDelete} from "@/api/management";

export default {
  data() {
    return {
      name: '',
      content: '',
      tableData: [],
      pageNum: 1,
      pageSize: 10,
      total: 0,
    }
  },
  created() {
    this.queryMessageList()
  },
  methods: {
    // 获取聊天列表
    async queryMessageList() {
      const params = {
        pageNum: this.pageNum,
        pageSize: this.pageSize,
        name: this.name,
        content: this.content
      }
      const res = await messageList(params)
      if(res.code===200) {
        this.tableData = res.rows
        this.total = res.total
      }
    },
    handleQueryClick() {
      this.queryMessageList()
    },
    async handleDeleteClick(row) {
      const params = {
        id: row.id
      }
      const res = await messageDelete(params)
      if(res.code===200) {
        this.$message("删除成功")
        this.queryMessageList()
      }
    },
    handleSizeChange(val) {
      this.pageSize = val
      this.queryMessageList()
    },
    handleCurrentChange(val) {
      this.pageNum = val
      this.queryMessageList()
    }
  }
}
</script>
<style lang="scss" scoped>
.chat-list {
  height: 100%;
  margin: 20px;

  .search {
    display: flex;
    justify-content: flex-start;
    align-items: center;

    .select-search {
      display: flex;
      justify-content: space-between;
      align-items: center;

      .chat-word {
        margin: 0 10px;
      }
    }
  }

  .table {
    margin: 20px 0;
  }
}
</style>
<style lang="scss">
.el-tooltip__popper {
  max-width: 50%;
}
</style>


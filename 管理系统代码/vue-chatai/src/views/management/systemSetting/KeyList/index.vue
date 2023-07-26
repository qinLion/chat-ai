<template>
  <div class="key-list">
    <div class="search">
      <div class="select-search">
        <el-input
          placeholder="请输入key关键词"
          suffix-icon="el-icon-search"
          v-model="title"
        >
        </el-input>
        <el-select clearable class="key-status" v-model="status" placeholder="请选择key状态">
          <el-option
            v-for="item in statusOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </div>
      <div class="btns">
        <el-button type="primary" @click="handleQueryClick">查询</el-button>
        <el-button type="primary" @click="handleAddClick">新增key</el-button>
        <el-button type="success" @click="handleTestClick">测试key</el-button>
      </div>
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
          prop="keyValue"
          label="key"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="status"
          label="状态"
          align="center"
          :formatter="statusFormatter"
        >
        </el-table-column>
        <el-table-column
          prop="useStatus"
          label="是否启用"
          align="center"
        >
          <template slot-scope="scope">
            <el-switch
              v-model="scope.row.useStatus"
              :active-value=0
              :inactive-value=1
              @change="handleStatusChange(scope.row)"
            ></el-switch>
          </template>
        </el-table-column>
        <el-table-column
          fixed="right"
          label="操作"
          align="center"
          width="180">
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
    <el-dialog
      title="新增key"
      :visible.sync="dialogVisible"
      width="30%"
      :before-close="handleClose"
    >
      <el-form :model="form" :rules="rules" ref="form">
        <el-form-item label="key的值:" prop="key" label-width="80px">
          <el-input v-model="form.key"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="conformForm">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
import {keyList,keyAdd,keyDelete,keyUpdate,keyTest} from "@/api/management";

export default {
  data() {
    return {
      title: '',
      statusOptions: [
        {
          value: 0,
          label: '正常'
        },
        {
          value: 1,
          label: '异常'
        }
      ],
      status: "",
      tableData: [],
      pageNum: 1,
      pageSize: 10,
      total: 0,
      dialogVisible: false,
      form: {
        key: ""
      },
      rules: {
        key: [
          { required: true, message: '请输入key的值', trigger: 'blur' },
        ]
      }
    }
  },
  created() {
    this.getKeyList()
  },
  methods: {
    async getKeyList() {
      const params = {
        pageNum: this.pageNum,
        pageSize: this.pageSize,
        title: this.title,
        status: this.status
      }
      const res = await keyList(params)
      if (res.code === 200) {
        this.tableData = res.rows
        this.total = res.total
      }
    },
    handleQueryClick() {
      this.getKeyList()
    },
    // 新增
    handleAddClick() {
      this.dialogVisible = true
    },
    handleClose() {
      this.dialogVisible = false
    },
    // 确定
    async conformForm() {
      const params = {
        key: this.form.key
      }
      const res = await keyAdd(params)
      if(res.code===200) {
        this.dialogVisible = false
        this.form = {}
        this.getKeyList()
      }
    },
    // 测试
    async handleTestClick() {
      const res = await keyTest()
      if(res.code===200) {
        this.$message("测试key成功")
        this.getKeyList()
      }
    },
    // 删除
    async handleDeleteClick(row) {
      const params = {
        id: row.id
      }
      const res = await keyDelete(params)
      if(res.code===200) {
        this.dialogVisible = false
        this.$message("删除成功")
        this.getKeyList()
      }
    },
    handleSizeChange(val) {
      this.pageSize = val
      this.getKeyList()
    },
    handleCurrentChange(val) {
      this.pageNum = val
      this.getKeyList()
    },
    // 状态修改
    handleStatusChange(row) {
      let text = row.useStatus == 0 ? "启用" : "禁用";
      this.$modal.confirm('确认要' + text + '"' + row.keyValue + '"吗？').then(function () {
        const params = {
          id: row.id,
          useStatus: row.useStatus
        }
        return keyUpdate(params);
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
        this.getKeyList()
      }).catch(function () {
        row.useStatus = row.useStatus == 1 ? 0 : 1;
      });
    },
    statusFormatter(row) {
      switch (row.status) {
        case 0:
          return "正常"
        case 1:
          return "异常"
      }
    }
  }
}
</script>
<style lang="scss" scoped>
.key-list {
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

      .key-status {
        margin: 0 10px;
      }

      .btns {

      }
    }
  }

  .table {
    margin: 20px 0;
  }
}
.el-dialog__wrapper {
  top: 100px;
}
</style>




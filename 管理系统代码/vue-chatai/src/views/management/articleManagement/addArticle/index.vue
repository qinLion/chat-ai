<template>
  <div class="add-article">
    <div class="main-panel">
      <div class="title">{{ title }}</div>
      <el-button type="primary" class="back" @click="handleBackClick">返回</el-button>
    </div>
    <div class="content">
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="文章标题:" prop="title">
          <el-input v-model="form.title"></el-input>
        </el-form-item>
        <el-form-item label="文章内容:" prop="content">
          <editor v-model="form.content" :min-height="380"/>
        </el-form-item>
      </el-form>
    </div>
    <div slot="footer" class="footer">
      <el-button type="primary" @click="publishForm">发 布</el-button>
    </div>
  </div>
</template>
<script>
import {articleAdd, articleUpdate,articleSelect} from "@/api/management";

export default {
  name: 'addArticle',
  props: {
    title: {
      type: String
    },
    id: {
      default: ""
    }
  },
  data() {
    return {
      form: {
        title: '',
        content: ''
      },
      rules: {
        title: [
          { required: true, message: '请输入文章标题', trigger: 'blur' },
        ],
      }
    }
  },
  created() {
    if(this.id) {
      this.getArticleSelect()
    }
  },
  methods: {
    async getArticleSelect() {
      const params = {
        id: this.id
      }
      const res = await articleSelect(params)
      if(res.code===200) {
        this.form.title = res.data.title
        this.form.content = res.data.content
      }
    },
    handleBackClick() {
      this.$emit('close')
    },
    publishForm() {
      if(this.id) {
        const params = {
          title: this.form.title,
          content: this.form.content,
          id:this.id
        }
        articleUpdate(params).then(res=>{
          this.$emit('close')
        })
      }else {
        const params = {
          title: this.form.title,
          content: this.form.content
        }
        articleAdd(params).then(res=>{
          if(res.code===200) {
            this.$emit('close')
          }
        })
      }
    }
  }
}
</script>
<style lang="scss" scoped>
.add-article {
  margin: 20px;
  border: solid 1px #ccc;
  padding: 25px;
  .main-panel {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .content {
    margin: 30px 0;
    width: 500px;
  }
  .footer {
    margin-top: 20px;
  }
}
</style>
